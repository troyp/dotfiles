#lang s-exp framework/keybinding-lang

;; frame-key (see drracket docs)
;; Bind key using drracket's extension API
;; Automatically adds the default shortcut prefix (normally c:)

(define modifiers
  (apply string-append
         (map (λ (p) (case p
                       [(ctl) "c:"]
                       [(cmd) "d:"]
                       [(alt meta) "~c:m:"]
                       [(shift) "s:"]
                       [(option) "a:"]))
              (get-default-shortcut-prefix))))
(define-syntax-rule (frame-key key command)
  (keybinding
   (string-append modifiers key)
   (λ (ed evt)
     (when (is-a? ed text:basic<%>)
       (define fr (send ed get-top-level-window))
       ; note: fr could be #f
       (when fr (send fr command))))))

;; -------------------------------------------------------------------------------
;; rebind (see drracket docs 3.3.9)
;; Bind key to duplicate an existing shortcut, using the name from the
;; "Show Active Keybindings" dialog

(define (rebind key command)
  (keybinding
   key
   (λ (ed evt)
     (send (send ed get-keymap) call-function
           command ed evt #t))))
;; -------------------------------------------------------------------------------
;; menu-bind (see drracket docs 3.3.9)
;; Bind key to menu item by name

(define (menu-bind key menu-item)
  (keybinding
   key
   (λ (ed evt)
     (define canvas (send ed get-canvas))
     (when canvas
       (define menu-bar (find-menu-bar canvas))
       (when menu-bar
         (define item (find-item menu-bar menu-item))
         (when item
           (define menu-evt
             (new control-event%
                  [event-type 'menu]
                  [time-stamp
                   (send evt get-time-stamp)]))
           (send item command menu-evt)))))))
(define/contract (find-menu-bar c)
  (-> (is-a?/c area<%>) (or/c #f (is-a?/c menu-bar%)))
  (let loop ([c c])
    (cond
      [(is-a? c frame%) (send c get-menu-bar)]
      [(is-a? c area<%>) (loop (send c get-parent))]
      [else #f])))
(define/contract (find-item menu-bar label)
  (-> (is-a?/c menu-bar%)
      string?
      (or/c (is-a?/c selectable-menu-item<%>) #f))
  (let loop ([o menu-bar])
    (cond
      [(is-a? o selectable-menu-item<%>)
       (and (equal? (send o get-plain-label) label)
            o)]
      [(is-a? o menu-item-container<%>)
       (for/or ([i (in-list (send o get-items))])
         (loop i))]
      [else #f])))

;; -------------------------------------------------------------------------------
;; Sending expressions to the Interactions window (see drracket docs 3.3.10)

(require drracket/tool-lib)
(define/contract (send-toplevel-form defs shift-focus?)
  (-> any/c boolean? any)
  (when (is-a? defs drracket:unit:definitions-text<%>)
    (define sp (send defs get-start-position))
    (when (= sp (send defs get-end-position))
      (cond
        [(send defs find-up-sexp sp)
         ;; we are inside some top-level expression;
         ;; find the enclosing expression
         (let loop ([pos sp])
           (define next-up (send defs find-up-sexp pos))
           (cond
             [next-up (loop next-up)]
             [else
              (send-range-to-repl defs
                                  pos
                                  (send defs get-forward-sexp pos)
                                  shift-focus?)]))]
        [else
         ;; we are at the top-level
         (define fw (send defs get-forward-sexp sp))
         (define bw (send defs get-backward-sexp sp))
         (cond
           [(and (not fw) (not bw))
            ;; no expressions in the file, give up
            (void)]
           [(not fw)
            ;; no expression after the insertion point;
            ;; send the one before it
            (send-range-to-repl defs
                                bw
                                (send defs get-forward-sexp bw)
                                shift-focus?)]
           [else
            ;; send the expression after the insertion point
            (send-range-to-repl defs
                                (send defs get-backward-sexp fw)
                                fw
                                shift-focus?)])]))))

(define/contract (send-selection defs shift-focus?)
  (-> any/c boolean? any)
  (when (is-a? defs drracket:unit:definitions-text<%>)
    (send-range-to-repl defs
                        (send defs get-start-position)
                        (send defs get-end-position)
                        shift-focus?)))

(define/contract (send-range-to-repl defs start end shift-focus?)
  (->i ([defs (is-a?/c drracket:unit:definitions-text<%>)]
        [start exact-positive-integer?]
        [end (start) (and/c exact-positive-integer? (>=/c start))]
        [shift-focus? boolean?])
       any)
  (unless (= start end) ;; don't send empty regions
    (define ints (send (send defs get-tab) get-ints))
    (define frame (send (send defs get-tab) get-frame))
    ;; copy the expression over to the interactions window
    (send defs move/copy-to-edit
          ints start end
          (send ints last-position)
          #:try-to-move? #f)

    ;; erase any trailing whitespace
    (let loop ()
      (define last-pos (- (send ints last-position) 1))
      (when (last-pos . > . 0)
        (define last-char (send ints get-character last-pos))
        (when (char-whitespace? last-char)
          (send ints delete last-pos (+ last-pos 1))
          (loop))))

    ;; put back a single newline
    (send ints insert
          "\n"
          (send ints last-position)
          (send ints last-position))

    ;; make sure the interactions is visible
    ;; and run the submitted expression
    (send frame ensure-rep-shown ints)
    (when shift-focus? (send (send ints get-canvas) focus))
    (send ints do-submission)))

(define/contract (send-form defs shift-focus?)
  (-> any/c boolean? any)
  (when (is-a? defs drracket:unit:definitions-text<%>)
    (define sp (send defs get-start-position))
    (when (= sp (send defs get-end-position))
      (define fw (send defs get-forward-sexp sp))
      (define bw (send defs get-backward-sexp sp))
      (cond
        [(and (not fw) (not bw))
         ;; no expressions in the file, give up
         (void)]
        [(not fw)
         ;; no expression after the insertion point;
         ;; send the one before it
         (send-range-to-repl defs
                             bw
                             (send defs get-forward-sexp bw)
                             shift-focus?)]
        [else
         ;; send the expression after the insertion point
         (send-range-to-repl defs
                             (send defs get-backward-sexp fw)
                             fw
                             shift-focus?)]))))

;; -------------------------------------------------------------------------------

(define-syntax-rule (keybind-toplevel-cmd key cmd)
  (keybinding key
              (λ (editor evt)
                (let ((top (send editor get-top-level-window)))
                  (send top cmd)))))

(keybind-toplevel-cmd "c:x;c:d" close-current-tab)
(keybind-toplevel-cmd "m:-" close-current-tab)
(keybind-toplevel-cmd "c:x;c:t" create-new-tab)
(keybind-toplevel-cmd "m:=" create-new-tab)
(menu-bind "c:x;c:c" "Quit")
(rebind "m:o" "shift-focus")
(menu-bind "m:r" "Revert")
(menu-bind "m:h;p" "Preferences...")
(menu-bind "m:h;k" "Show Active Keybindings")
(keybinding "c:x;c:d" (λ (ed evt) (send-toplevel-form ed #f)))
(keybinding "c:x;c:e" (λ (ed evt) (send-form ed #f)))
(keybinding "c:x;c:r" (λ (ed evt) (send-selection ed #f)))

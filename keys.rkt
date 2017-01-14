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
;; rebind (see drracket docs)
;; Bind key to duplicate an existing shortcut, using the name from the
;; "Show Active Keybindings" dialog

(define (rebind key command)
  (keybinding
   key
   (λ (ed evt)
     (send (send ed get-keymap) call-function
           command ed evt #t))))
;; -------------------------------------------------------------------------------
;; menu-bind (see drracket docs)
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

(define-syntax-rule (keybind-toplevel-cmd key cmd)
  (keybinding key
              (λ (editor evt)
                (let ((top (send editor get-top-level-window)))
                  (send top cmd)))))

(keybind-toplevel-cmd "c:x;c:d" close-current-tab)
(keybind-toplevel-cmd "m:-" close-current-tab)
(keybind-toplevel-cmd "c:x;c:t" create-new-tab)
(keybind-toplevel-cmd "m:=" create-new-tab)
(menu-bind "c:x;c:r" "Run")
(menu-bind "c:x;c:c" "Quit")
(rebind "m:o" "shift-focus")

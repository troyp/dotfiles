;; {:user {:plugins
;;         [[lein-catnip "0.5.1"]
;;          [org.bodil/lein-noderepl "0.1.11"]
;;          ]
;;         }
;;  }
{:repl {:plugins
        [[cider/cider-nrepl "0.14.0"]
         [refactor-nrepl "2.3.1"]
         [lein-exec "0.3.6"]
         [lein-gorilla "0.4.0"]
         ]
        :dependencies
        [[alembic "0.3.2"]
         [org.clojure/tools.nrepl "0.2.12"]
         ]
        }
 }

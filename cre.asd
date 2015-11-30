;; The ASDF system setup, so this system can be QuickLisp
;; quickloadable with zero other setup.

(asdf:defsystem cre
  :description "A Common Lisp SDL Roguelike engine"
  :version "0.0"
  :author "Archenoth <archenoth@gmail.com>"
  :licence "MIT"
  :serial t
  :depends-on (:lispbuilder-sdl)
  :components ((:file "packages")
               (:module game
                :serial t
                :pathname "game"
                :components ((:file "classes")
                             (:file "info")
                             (:file "player")
                             (:file "engine")))))

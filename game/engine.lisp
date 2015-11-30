;; The engine, which includes the game loop and dispatcher logic for
;; the game, as well as the SDL window-handling code.
(in-package :com.archenoth.cre)

(defun game-loop ()
  "The main game loop that initialized SDL, and the gameplay engine
itself!"
  (with-init ()
    (window 800 600)
    (with-events ()
      (:quit-event () t)
      (:video-expose-event () (update-display))
      (:key-down-event (:key key)
                       (handle-key-event (get-keybinding key) t))
      (:key-up-event (:key key)
                     (handle-key-event (get-keybinding key) nil)))))

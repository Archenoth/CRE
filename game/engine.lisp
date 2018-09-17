;; The engine, which includes the game loop and dispatcher logic for
;; the game, as well as the SDL window-handling code.
(in-package :com.archenoth.cre)

(defun game-loop ()
  "The main game loop that initialized SDL, and the gameplay engine
itself!"
  (sdl:with-init ()
    (window 800 600)
    (setf (actor-sprite *player*) (sdl:load-image "img/Blobby.bmp"))
    (with-events ()
      (:quit-event () t)
      (:idle () (render))
      (:key-down-event (:key key)
                       (handle-key-event (get-keybinding key) t))
      (:key-up-event (:key key)
                     (handle-key-event (get-keybinding key) nil)))))

(defun render ()
  "Draws the things in the world and updates the display"
  (sdl:clear-display (sdl:color :r 0 :g 0 :b 0))
  (with-slots (sprite x y) *player*
    (sdl:draw-surface-at sprite (sdl:point :x (* 50 x) :y (* 50 (- y)))))
  (sdl:update-display))

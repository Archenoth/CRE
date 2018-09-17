;; Code relating to the player, and handling their inputs
(in-package :com.archenoth.cre)

(defparameter *keybindings*
  (with-open-file (config "config.lisp" :if-does-not-exist nil)
    (or config
        '((:sdl-key-escape . :menu)
          (:sdl-key-up . :up)
          (:sdl-key-down . :down)
          (:sdl-key-left . :left)
          (:sdl-key-right . :right)
          (:sdl-key-i . :inventory)
          (:sdl-key-space . :use))))
  "The main keybindings for the player.")

(defparameter *player*
  (make-instance 'player :x 10 :y 10 :health 20 :name "Silly player")
  "You, the player..!")

(defun get-keybinding (key)
  "Gets the keybinding associated with the SDL key event."
  (cdr (assoc key *keybindings*)))

(defgeneric handle-key-event (event state)
  (:documentation "Handles key events bound to keypresses for the
  player."))

(defmethod handle-key-event (event state)
  "The catch-all method for undefined keys."
  (format t "Unknown event: ~a! State: ~a~%" event state))

(defmethod handle-key-event ((event (eql :menu)) state)
  "Menu key just quites for now..."
  (push-quit-event))

(defmethod handle-key-event ((event (eql :up)) state)
  "Player movement upward"
  (when state
    (incf (actor-y *player*))))

(defmethod handle-key-event ((event (eql :down)) state)
  "Player movement downward"
  (when state
    (incf (actor-y *player*) -1)))

(defmethod handle-key-event ((event (eql :left)) state)
  "Player movement to the left"
  (when state
    (incf (actor-x *player*) -1)))

(defmethod handle-key-event ((event (eql :right)) state)
  "Player movement to the right"
  (when state
    (incf (actor-x *player*))))

(defmethod handle-key-event ((event (eql :inventory)) state)
  "When the player opens their inventory..."
  (when state
    (format t "The player currently has: ~a~%" (actor-inventory *player*))))

(defmethod handle-key-event ((event (eql :use)) state)
  "When the player attempts to use an object nearby"
  (when state
    (format t "There is nothing to use..!~%")))

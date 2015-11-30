;; Information functions that show the state of the world!
(in-package :com.archenoth.cre)

(defun print-actor-info (actor)
  "Prints out some basic information about the passed in actor,
including their coordinates and name..."
  (with-slots (name x y) actor
    (format t "~a now at coordinates (~d,~d)~%" name x y)))

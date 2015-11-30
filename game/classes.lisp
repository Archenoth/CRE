;; The classes CRE will use for its player, NPCs, enemies, and so
;; on...
(in-package :com.archenoth.cre)

(defclass actor ()
  ((name
    :accessor actor-name
    :type string
    :initarg :name
    :initform "Actor"
    :documentation "The name of the actor")
   (x
    :accessor actor-x
    :type number
    :initarg :x
    :initform 0
    :documentation "The X coordinate of this actor")
   (y
    :accessor actor-y
    :type number
    :initarg :y
    :initform 0
    :documentation "The Y coordinate of this actor")
   (health
    :accessor actor-health
    :type number
    :initarg :health
    :initform 1
    :documentation "The health of a particular actor")
   (inventory
    :accessor actor-inventory
    :type list
    :initarg :inventory
    :initform (gensym)
    :documentation "A place where all this actor's goodies are held."))
  (:documentation "A 'thing with logic' in the game world"))

(defclass player (actor)
  ()
  (:documentation "The player actor"))

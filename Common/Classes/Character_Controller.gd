class_name CharacterController
extends CharacterBody2D

@export var can_move: bool = true
@export var can_attack: bool = true

var input_vector: Vector2 = Vector2.ZERO
@export var facing_vector: Vector2 = Vector2.DOWN

func get_animation_name(animation_prefix: String = "") -> String:
	match facing_vector:
		Vector2.LEFT:
			return str(animation_prefix, "_left")
		Vector2.RIGHT:
			return str(animation_prefix, "_right")
		Vector2.UP:
			return str(animation_prefix, "_up")
		Vector2.DOWN:
			return str(animation_prefix, "_down")
	return ""

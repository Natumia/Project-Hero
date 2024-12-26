class_name Move
extends State

@export var character_controller: CharacterController

@export var movement_speed: float = 72.0

func _update_physics(_delta: float) -> void:
	if character_controller:
		character_controller.velocity = character_controller.input_vector * movement_speed
		character_controller.move_and_slide()
		if character_controller.velocity == Vector2.ZERO:
			transition.emit("idle")

class_name Idle
extends State

@export var character_controller: CharacterController

func _update(_delta: float) -> void:
	if character_controller:
		if character_controller.can_move == true and character_controller.input_vector != Vector2.ZERO:
			transition.emit("moving")
			

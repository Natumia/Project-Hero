class_name EnemyChase
extends EnemyState

@export var movement_speed: float = 28.0

func _update_physics(_delta: float) -> void:
	if character_controller.global_position.distance_to(get_player_vector()) >= 48:
		transition.emit("idle")
	else:
		var direction_vector = character_controller.global_position.direction_to(get_player_vector())
		character_controller.velocity = direction_vector * movement_speed
		character_controller.move_and_slide()

func _state_end() -> void:
	character_controller.velocity = Vector2.ZERO

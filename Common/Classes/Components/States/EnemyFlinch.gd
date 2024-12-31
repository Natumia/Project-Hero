class_name EnemyFlinch
extends EnemyState

@export var rebound_force: float = 10
@export var rebound_time: float = 0.1

func _state_begin() -> void:
	character_controller.velocity = -character_controller.global_position.direction_to(get_player_vector()) * rebound_force

func _update(_delta) -> void:
	await get_tree().create_timer(rebound_time).timeout
	transition.emit("idle")

func _update_physics(_delta) -> void:
	character_controller.move_and_slide()

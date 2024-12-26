class_name EnemyChase
extends State

@export var character_controller: CharacterController

@export var movement_speed: float = 28.0

var player_vector: Vector2

func _state_begin() -> void:
	player_vector = get_tree().get_first_node_in_group("Player").global_position

func _update(_delta: float) -> void:
	player_vector = get_tree().get_first_node_in_group("Player").global_position

func _update_physics(_delta: float) -> void:
	if character_controller.global_position.distance_to(player_vector) >= 48:
		transition.emit("idle")
	else:
		var direction_vector = character_controller.global_position.direction_to(player_vector)
		character_controller.velocity = direction_vector * movement_speed
		character_controller.move_and_slide()

func _state_end() -> void:
	character_controller.velocity = Vector2.ZERO

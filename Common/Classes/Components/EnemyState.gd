class_name EnemyState
extends State

@export var character_controller: CharacterController

func get_player_vector() -> Vector2:
	var player_vector: Vector2
	if get_tree().get_first_node_in_group("Player") != null:
		player_vector = get_tree().get_first_node_in_group("Player").global_position
		return player_vector
	else:
		return Vector2.ZERO

extends Node

@export var player_scene: PackedScene
var current_player: CharacterController

var current_map

func _ready() -> void:
	spawn_map(load("res://Maps/debug_map.tscn"))
	spawn_player(Vector2.ZERO, Vector2.UP)

func spawn_player(spawn_position: Vector2 = Vector2.ZERO, facing_direction: Vector2 = Vector2.DOWN) -> void:
	if spawn_position == Vector2.ZERO:
		var spawn_node = get_tree().get_first_node_in_group("Spawn")
		if spawn_node != null:
			spawn_position = spawn_node.global_position
	if player_scene != null:
		current_player = player_scene.instantiate()
		add_child(current_player)
		current_player.global_position = spawn_position
		current_player.facing_vector = facing_direction

func spawn_map(input_scene: PackedScene) -> void:
	current_map = input_scene.instantiate()
	add_child(current_map)

func change_map(input_scene: PackedScene) -> void:
	pass

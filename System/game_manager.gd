extends Node

@export var player_scene: PackedScene
@export var current_player: CharacterController

@export var current_map: MapController

func _ready() -> void:
	spawn_map(load("res://Maps/test_map.tscn"))
	spawn_player(Vector2(24, 120), Vector2.UP)

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
	connect_to_transfers()

func transfer_map(target_map, spawn_vector, facing_vector) -> void:
	var new_map = target_map
	current_map.queue_free()
	current_player.queue_free()
	spawn_map(new_map)
	spawn_player(spawn_vector, facing_vector)

func connect_to_transfers() -> void:
	for i in get_tree().get_nodes_in_group("Transfer"):
		i.connect("player_entered", transfer_map)

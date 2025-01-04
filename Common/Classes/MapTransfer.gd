class_name MapTransfer
extends Area2D

signal player_entered

@export var target_map: PackedScene
@export var spawn_vector: Vector2 = Vector2.ZERO
@export var facing_vector: Vector2 = Vector2.DOWN

func _ready() -> void:
	add_to_group("Transfer")
	connect("body_entered", _on_body_entered)

func _on_body_entered(_body: Node2D) -> void:
	player_entered.emit(target_map, spawn_vector, facing_vector)

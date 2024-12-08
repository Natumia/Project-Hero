class_name Health
extends Node

signal no_health
signal target_hit

@export var max_health: float = 3.0
@export var start_with_max_health: bool = true
@export var current_health: float = 3.0

@export var hurt_box: Area2D

func _ready() -> void:
	if start_with_max_health:
		current_health = max_health
		
	if hurt_box:
		hurt_box.area_entered.connect(damage)
		

func damage(area) -> void:
	target_hit.emit(current_health)
	current_health -= area.power
	if current_health <= 0.0:
		no_health.emit()
		

class_name Flinch
extends Node

signal target_flinch

@export var character_controller: CharacterController
@export var movement: Movement
@export var hurt_box: HurtBox

@export var force_multiplier: float = 3.0
@export var delay_input: float = 0.05

func _ready() -> void:
	if hurt_box:
		hurt_box.area_entered.connect(flinch)

func flinch(area) -> void:
	target_flinch.emit()
	if movement:
		character_controller.can_move = false
		character_controller.can_attack = false
		character_controller.input_vector = -character_controller.global_position.direction_to(area.global_position) * force_multiplier
		await get_tree().create_timer(delay_input).timeout
		character_controller.can_move = true
		character_controller.can_attack = true
		character_controller.input_vector = Vector2.ZERO
	else: printerr("Requires Movement Component.")

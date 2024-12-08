class_name Movement
extends Node

@export var character_controller: CharacterController

@export var speed: float = 72.0

func _physics_process(_delta: float) -> void:
	movement(character_controller.input_vector)

func movement(input_vector: Vector2 = Vector2.ZERO) -> void:
	character_controller.velocity = input_vector * speed
	character_controller.move_and_slide()

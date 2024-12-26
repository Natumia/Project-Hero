class_name EnemyIdle
extends State

@export var character_controller: CharacterController

@export var movement_speed: float = 18

@export var wait_timer: float = 2.8
@export var wait_timer_variance: float = 0.2
var wait_time_left: float

@export var move_timer: float = 1.1
@export var move_timer_variance: float = 0.5
var move_time_left: float

func _state_begin() -> void:
	wait_time_left = wait_timer * randf_range(1 - wait_timer_variance, 1 + wait_timer_variance)
	move_time_left = move_timer * randf_range(1 - move_timer_variance, 1 + move_timer_variance)

func _update(delta: float) -> void:
	var player_node = get_tree().get_first_node_in_group("Player")
	if player_node:
		var player_vector = player_node.global_position
		if character_controller.global_position.distance_to(player_vector) < 48:
			transition.emit("chase")
	if wait_time_left > 0:
		wait_time_left -= delta
	else:
		$"../../AnimationPlayer".play("move")
		character_controller.velocity = Vector2(randf_range(-1, 1), randf_range(-1, 1)).normalized() * movement_speed
		move_time_left = move_timer * randf_range(1 - move_timer_variance, 1 + move_timer_variance)
		wait_time_left = wait_timer * randf_range(1 - wait_timer_variance, 1 + wait_timer_variance)
	
	if move_time_left > 0:
		move_time_left -= delta
	else:
		$"../../AnimationPlayer".play("idle")

func _update_physics(_delta: float) -> void:
	if move_time_left >= 0:
		character_controller.move_and_slide()

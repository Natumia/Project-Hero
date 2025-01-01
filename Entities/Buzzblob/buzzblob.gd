extends CharacterController

func _ready() -> void:
	$HealthBar.max_value = $Health.max_health
	$HealthBar.value = $Health.current_health

func _process(_delta: float) -> void:
	$StateMachineDebug.text = $StateMachine.current_state.name
	
	if velocity != Vector2.ZERO:
		$AnimationPlayer.play("move")
	else:
		$AnimationPlayer.play("idle")
		

func _on_hurt_box_area_entered(_area: Area2D) -> void:
	$StateMachine.change_state("flinch")

func _on_hit_box_body_entered(_body: Node2D) -> void:
	$StateMachine.change_state("rebound")

func _on_health_target_hit(value) -> void:
	$HealthBar.value = value

func _on_health_no_health() -> void:
	queue_free()

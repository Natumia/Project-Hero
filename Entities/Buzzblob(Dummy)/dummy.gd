extends CharacterController

@onready var animation_player: AnimationPlayer = $AnimationPlayer

func _on_health_no_health() -> void:
	queue_free()

func _on_health_target_hit(health) -> void:
	animation_player.stop()
	animation_player.play("shock")
	print(str(health, " remaining"))

func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	if anim_name == "shock":
		animation_player.play("idle")

func _process(_delta: float) -> void:
	$StateMachinDebug.text = $StateMachine.current_state.name

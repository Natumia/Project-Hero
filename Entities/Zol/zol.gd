extends CharacterController

func _process(_delta: float) -> void:
	$StateMachineDebug.text = $StateMachine.current_state.name

class_name StateMachine
extends Node

@export var initial_state: State

var current_state: State
var loaded_states: Dictionary = {}

func change_state(input_state: String) -> void:
	if loaded_states.has(input_state.to_lower()):
		if loaded_states[input_state.to_lower()] != current_state:
			var previous_state = current_state
			if loaded_states[input_state.to_lower()]:
				current_state = loaded_states[input_state.to_lower()]
				previous_state._state_end()
				current_state._state_begin()
				

func _physics_process(delta: float) -> void:
	if current_state:
		current_state._update_physics(delta)
		

func _process(delta: float) -> void:
	if current_state:
		current_state._update(delta)
		

func _ready() -> void:
	for i in get_children():
		if i is State:
			loaded_states[i.name.to_lower()] = i
			i.transition.connect(change_state)
			
	if initial_state:
		if loaded_states.has(initial_state.name.to_lower()):
			current_state = loaded_states[initial_state.name.to_lower()]
			

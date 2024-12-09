class_name PlayerController
extends CharacterController

@onready var player_animator: AnimationPlayer = $PlayerAnimator
@onready var weapon_animator_player: AnimationPlayer = $Weapon/AnimationPlayer

func _physics_process(_delta: float) -> void:
	if can_move == true:
		input_vector = Input.get_vector("move_left", "move_right", "move_up", "move_down")
		if velocity != Vector2.ZERO:
			player_animator.play(get_animation_name("move"))
		else:
			player_animator.play(get_animation_name("idle"))
			
	if input_vector != Vector2.ZERO:
		if abs(input_vector.x) == abs(input_vector.y):
			facing_vector.y = input_vector.y
			facing_vector.x = 0
		else: 
			facing_vector = input_vector
		facing_vector = sign(facing_vector)
		
	if Input.is_action_just_pressed("attack") and can_attack:
		can_move = false
		can_attack = false
		input_vector = Vector2.ZERO
		player_animator.stop()
		weapon_animator_player.stop()
		player_animator.play(get_animation_name("use"))
		weapon_animator_player.play(get_animation_name("sword"))
		

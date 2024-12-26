class_name Flinch
extends State

@export var character_controller: CharacterController
@export var hurt_box: HurtBox

@export var force: float = 125.0

var avoid_vector: Vector2 = Vector2.ZERO

func _ready() -> void:
	hurt_box.area_entered.connect(start_flinch)

func start_flinch(area) -> void:
	avoid_vector = area.global_position
	transition.emit("flinch")

func _update_physics(_delta: float) -> void:
	character_controller.velocity = -character_controller.global_position.direction_to(avoid_vector) * force
	character_controller.move_and_slide()
	await get_tree().create_timer(0.0875).timeout
	character_controller.velocity = Vector2.ZERO
	transition.emit("idle")

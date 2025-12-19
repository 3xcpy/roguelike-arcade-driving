extends CharacterBody2D

@export var max_speed: float = 200.0
@export var accel: float = 100.0
@export var steer_strength: float = 30.0
@export var grip: float = 1.0

@export var wheel_base: float = 16.0 # distance between the front and back wheel

@onready var s1 = $Sprite2D2
@onready var s2 = $Sprite2D3


func _physics_process(delta: float) -> void:
	var steer = Input.get_axis("steer_left", "steer_right") * steer_strength
	velocity = transform.y * max_speed

	var front_wheel: Vector2 = position + transform.x * (wheel_base/2.0)
	var back_wheel: Vector2 = position - transform.x * (wheel_base/2.0)

	front_wheel += velocity.rotated(deg_to_rad(steer)) * delta
	back_wheel += velocity * delta

	s1.global_position = front_wheel
	s2.global_position = back_wheel

	var new_dir = back_wheel.direction_to(front_wheel)

	velocity = new_dir * velocity.length()
	rotation = new_dir.angle()
	move_and_slide()

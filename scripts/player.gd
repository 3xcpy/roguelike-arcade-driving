extends CharacterBody2D

@export var speed: float = 200.0
@export var accel: float = 100.0
@export var steer_strength: float = 30.0
@export var traction: float = 10.0

@export var wheel_base: float = 16.0 # distance between the front and back wheel


func _physics_process(delta: float) -> void:
	if velocity.length() < speed:
		velocity += transform.x * accel * delta

	var steer = Input.get_axis("steer_left", "steer_right") * deg_to_rad(steer_strength)

	var front_wheel: Vector2 = position + transform.x * (wheel_base/2.0)
	var back_wheel: Vector2 = position - transform.x * (wheel_base/2.0)

	front_wheel += velocity.rotated(steer) * delta
	back_wheel += velocity * delta

	var new_dir = back_wheel.direction_to(front_wheel)

	velocity = lerp(velocity, new_dir * velocity.length(), traction * delta)
	rotation = new_dir.angle()
	move_and_slide()
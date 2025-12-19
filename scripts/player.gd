extends CharacterBody2D

@export var max_speed: float = 200.0
@export var accel: float = 100.0
@export var steer_strength: float = 30.0
@export var grip: float = 1.0

@export var wheel_base: float = 16.0 # distance between the front and back wheel


func _physics_process(delta: float) -> void:
	var steer = Input.get_axis("steer_left", "steer_right") * steer_strength

	var front_wheel: Vector2 = position + wheel_base/2.0 * Vector2.UP.rotated(rotation)
	var back_wheel: Vector2 = position - wheel_base/2.0 * Vector2.UP.rotated(rotation)

	front_wheel += max_speed * Vector2.UP.rotated(rotation + deg_to_rad(steer)) * delta
	back_wheel += max_speed * Vector2.UP.rotated(rotation) * delta

	var new_location = (front_wheel + back_wheel) / 2
	rotation = (front_wheel - back_wheel).angle()
	position = new_location

	# velocity = (new_location - position).normalized() * accel
	move_and_slide()
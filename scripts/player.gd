extends RigidBody2D

@export var steering_wheels: Array[Wheel]
@export var fixed_wheels: Array[Wheel]

@export var max_speed: float = 200.0
@export var accel: float = 100.0
@export var steer_strength: float = 15.0


func _physics_process(delta: float) -> void:
	var steer = Input.get_axis("steer_left", "steer_right") * steer_strength

	for w in steering_wheels:
		w.rotation = deg_to_rad(steer)
		print(w.rotation)
		print(w.global_rotation)

	var accel_dir = -transform.y
	var forward_speed: float = accel_dir.dot(linear_velocity)
	if forward_speed < max_speed:
		apply_force(accel_dir.normalized() * accel * delta * mass)

	for w in steering_wheels:
		update_wheel(w, delta)
	for w in fixed_wheels:
		update_wheel(w, delta)
	

func update_wheel(w: Wheel, delta: float) -> void:
	var force = w.calculate_steering_force(delta)
	apply_force(force, w.position)
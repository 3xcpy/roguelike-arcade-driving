class_name Wheel extends VelocityTracker

@export var grip: float = 1.0
@export var mass: float = 1.0

func calculate_steering_force(delta: float) -> Vector2:
	update_velocity()

	var steering_dir = global_transform.x
	var steering_vel: float = velocity.dot(steering_dir)

	var desired_vel_change: float = -steering_vel * grip
	var desired_accel: float = desired_vel_change / delta

	print("calculated wheel force direction: ", steering_dir, ", desired velocity change: ", desired_vel_change, ", steering velocity", steering_vel)
	return Vector2(steering_dir * mass * desired_accel)


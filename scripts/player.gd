extends CharacterBody2D

@export var speed: float = 200.0
@export var accel: float = 100.0
@export var bounce_force: float = 100.0

@export var steer_strength: float = 30.0

@export var traction: float = 10.0
@export var drift_traction: float = 1.0
@export var drift_trigger: float = 0.5

@export var wheel_base: float = 16.0 # distance between the front and back wheel

@onready var drift_particles: GPUParticles2D = $DriftParticles


func damage(dmg: float): $HealthComponent.damage(dmg)


func _physics_process(delta: float) -> void:
	if velocity.length() < speed:
		velocity += transform.x * accel * delta

	var steer = Input.get_axis("steer_left", "steer_right") * deg_to_rad(steer_strength)

	var front_wheel: Vector2 = position + transform.x * (wheel_base/2.0)
	var back_wheel: Vector2 = position - transform.x * (wheel_base/2.0)

	front_wheel += velocity.rotated(steer) * delta
	back_wheel += velocity * delta

	var new_dir = back_wheel.direction_to(front_wheel)

	var slide: float = velocity.normalized().dot(new_dir.normalized())
	var current_traction
	if slide > drift_trigger: # not drifting
		current_traction = traction
		drift_particles.emitting = false
	else: # drifting
		current_traction = drift_traction
		drift_particles.amount_ratio = ((velocity.length() / speed) - 0.5) * 2.0
		drift_particles.emitting = true

	velocity = lerp(velocity, new_dir * velocity.length(), current_traction * delta)
	rotation = new_dir.angle()

	for i in get_slide_collision_count():
		var col := get_slide_collision(i)
		if col.get_collider():
			if col.get_collider().is_in_group("LevelColliders"):
				velocity = col.get_normal() * bounce_force
				if col.get_normal().dot(transform.x) < -0.8:
					rotation_degrees = rotation_degrees + 180.0

	move_and_slide()


func _on_health_component_damaged(_damage: float) -> void:
	$DamageParticles.emitting = true
	$DamageParticles.restart()
	print("player damaged")


func _on_health_component_dead() -> void:
	print("PLAYER DIED")
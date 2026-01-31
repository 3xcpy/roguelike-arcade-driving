class_name Enemy extends Area2D

@export var attack_damage: float = 1.0
@export var value: int = 1
@export var speed: float = 50.0
@export var accel: float = 10.0
@export var decel: float = 1.0
@export var level: int = 1:
	set(new_level):
		level = new_level
		if Engine.is_editor_hint():
			update_values()

var tick: float = 0.1
var timer := 0.0
var index := 0
@export var update_amount: int = 10
var update_timer: int = 0

var velocity: Vector2 = Vector2.ZERO


@onready var navigation_agent: NavigationAgent2D = $NavigationAgent2D


func _ready() -> void:
	index = Global.get_enemy_index()
	update_values()


func _physics_process(delta: float) -> void:
	# attacking
	timer += delta
	if timer >= tick:
		timer = 0.0
		var overlapping_bodies = get_overlapping_bodies()
		for b in overlapping_bodies:
			if b.is_in_group("Player"):
				if b.has_method("damage"):
					b.damage(attack_damage)
	
	if update_timer % update_amount == index % update_amount:
		navigate()
	update_timer += 1	

	var dir = to_local(navigation_agent.get_next_path_position()).normalized()
	var desired_vel = dir * speed
	var new_vel = Vector2.ZERO

	if velocity.length() < desired_vel.length():
		new_vel = lerp(velocity, desired_vel, accel * delta)
	else:
		new_vel = lerp(velocity, Vector2.ZERO, decel * delta)
	
	global_position += velocity * delta

	navigation_agent.set_velocity(new_vel)


func navigate() -> void:
	var player = get_tree().get_nodes_in_group("Player")[0]
	navigation_agent.target_position = player.global_position


func update_values() -> void:
	scale = Vector2(level, level)
	attack_damage = level
	value = level
	$HealthComponent.max_health = $HealthComponent.max_health * level
	$HealthComponent.health = $HealthComponent.max_health


func damage(dmg: float): $HealthComponent.damage(dmg)


func _on_health_component_dead() -> void:
	Global.game_manager.add_score(value)
	Global.enemy_stat += 1
	queue_free()


func _on_health_component_damaged(_dmg: float) -> void:
	$DamageParticles.emitting = true
	$DamageParticles.restart()

func _on_navigation_agent_2d_velocity_computed(safe_velocity: Vector2) -> void:
	velocity = safe_velocity
class_name DamageAreaSpawner extends Node2D

@export var damage_area: PackedScene
@export var spawns_per_second: float = 0.5
@export var radius: float = 16.0
@export var damage: float = 1.0
@export var lifetime: float = 2.0

var timer: float = 0.0


func _physics_process(delta: float) -> void:
	timer += delta
	if timer >= 1.0/spawns_per_second:
		timer = 0.0
		var instance: DamageArea = damage_area.instantiate()
		instance.radius = radius
		instance.damage = damage
		instance.lifetime = lifetime
		instance.global_position = global_position
		add_child(instance)
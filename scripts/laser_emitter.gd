class_name LaserEmitter extends Node2D

@export var active: bool = false

@export var damage: float = 1.0
@export var delay: float = 0.5
@export var laser: PackedScene
@export var reach: float = 256.0

var timer: float = 0.0


func shoot(target: Vector2) -> void:
	var laser_instance: Laser = laser.instantiate()
	add_child(laser_instance)
	laser_instance.global_position = global_position
	laser_instance.init(global_position.direction_to(target) * reach + global_position)


func _physics_process(delta: float) -> void:
	global_rotation = 0.0
	timer += delta
	if timer >= delay:
		timer = 0.0
		var enemies = get_tree().get_nodes_in_group("Enemies")
		var min_dist: float = 1e300
		var nearest: Node2D = null
		for e: Node2D in enemies:
			var dist = global_position.distance_to(e.global_position)
			if dist < min_dist:
				min_dist = dist
				nearest = e
		
		if nearest and min_dist <= reach:
			shoot(nearest.global_position)
class_name Shooter extends Node2D

@export var num_bullets: int = 2
var chosen: Array[Node2D] 


func _physics_process(_delta: float) -> void:
	shoot()


func shoot() -> void:
	var targets := get_tree().get_nodes_in_group("Enemies")
	var min_dist = 0.0
	chosen.resize(num_bullets)

	for i in num_bullets:
		min_dist = 0.0
		for t: Node2D in targets:
			var distance = global_position.distance_to(t.global_position)
			if min_dist == 0.0 or distance < min_dist:
				chosen[i] = t
				min_dist = distance
		targets.erase(chosen[i])

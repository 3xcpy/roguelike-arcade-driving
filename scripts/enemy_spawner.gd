class_name EnemySpawner extends Node2D

@export var enemy_scene: PackedScene

var time_to_next_spawn: float = 5.0


func spawn() -> void:
	var enemy: Enemy = enemy_scene.instantiate()
	enemy.level = ceil(float(Global.game_manager.level) / 10.0) + randi_range(0, 2)
	add_child(enemy)
class_name EnemySpawner extends Node2D

@export var enemy_scene: PackedScene

var time_to_next_spawn: float = 5.0


func _physics_process(delta: float) -> void:
	time_to_next_spawn -= delta
	if time_to_next_spawn <= 0:
		spawn()
		time_to_next_spawn = 5.0


func spawn() -> void:
	var enemy: Enemy = enemy_scene.instantiate()
	enemy.level = int(max(ceil(float(Global.game_manager.level) / 2.0) + randi_range(0, 2), 0.0))
	add_child(enemy)
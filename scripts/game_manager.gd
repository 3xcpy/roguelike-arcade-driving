class_name GameManager extends Node2D

signal game_over

@export var initial_score_to_level: int = 5
var level: int = 0
var score_to_level: int = 0
var max_score_to_level: int = 0

@export var upgrades: Array[Upgrade] = []


func _ready() -> void:
	Global.game_manager = self
	Global.enemy_stat = 0
	Global.upgrade_stat = 0
	score_to_level = initial_score_to_level
	max_score_to_level = score_to_level


func add_score(amount: int) -> void:
	score_to_level -= amount
	if score_to_level <= 0:
		levelup(-score_to_level)


func levelup(overshoot: int) -> void:
	level += 1
	score_to_level = score_to_level + 10 + round(pow(1.5, level))
	max_score_to_level = score_to_level
	score_to_level -= overshoot
	var u1 = upgrades[randi() % upgrades.size()]
	var u2 = upgrades[randi() % upgrades.size()]
	var u3 = upgrades[randi() % upgrades.size()]
	Global.upgrade_select_screen.set_slots(u1, u2, u3)


func _on_player_dead() -> void:
	game_over.emit()
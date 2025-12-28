class_name GameManager extends Node2D

@export var initial_score_to_level: int = 10
var level: int = 0
var score_to_level: int = 0
@export var scalar: float = 1.05


func _ready() -> void:
	Global.game_manager = self


func add_score(amount: int) -> void:
	score_to_level -= amount
	if score_to_level <= 0:
		levelup(-score_to_level)


func levelup(overshoot: int) -> void:
	level += 1
	score_to_level = (int)(initial_score_to_level * pow(scalar, level))
	score_to_level -= overshoot
	# TODO: upgrades
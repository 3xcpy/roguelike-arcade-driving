class_name HUD extends Control

@onready var health_bar: ProgressBar = $MarginContainer/VBoxContainer/HealthBar
@onready var score_progress_bar: ProgressBar = $MarginContainer/VBoxContainer/ScoreProgressBar

func _process(_delta: float) -> void:
	health_bar.value = Global.player.health_component.health / Global.player.health_component.max_health * 100.0
	score_progress_bar.value = float(Global.game_manager.score_to_level) / float(Global.game_manager.max_score_to_level) * 100.0
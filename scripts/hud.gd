class_name HUD extends Control

@onready var health_bar: ProgressBar = $MarginContainer/HealthBar

func _process(_delta: float) -> void:
	health_bar.value = Global.player.health_component.health / Global.player.health_component.max_health * 100.0
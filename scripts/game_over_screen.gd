class_name GameOverScreen extends Control

@onready var enemy_stats_label: Label = $VBoxContainer/Label2
@onready var upgrade_stats_label: Label = $VBoxContainer/Label


func _ready() -> void:
	enemy_stats_label.text = str("You killed %d enemies" % Global.enemy_stat)
	upgrade_stats_label.text = str("You upgraded %d times" % Global.upgrade_stat)
	enemy_stats_label.text = str("You killed %d enemies" % 0)
	upgrade_stats_label.text = str("You upgraded %d times" % 0)
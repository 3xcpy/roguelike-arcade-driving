class_name GameOverScreen extends Control

signal continue_to_menu

@onready var enemy_stats_label: Label = $VBoxContainer/Label2
@onready var upgrade_stats_label: Label = $VBoxContainer/Label


func _ready() -> void:
	enemy_stats_label.text = str("You killed %d enemies" % Global.enemy_stat)
	upgrade_stats_label.text = str("You upgraded %d times" % Global.upgrade_stat)


func _on_button_button_up() -> void:
	continue_to_menu.emit()
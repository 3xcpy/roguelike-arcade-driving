class_name UpgradeSelectScreen extends Control

@onready var slot1_label: RichTextLabel = $MarginContainer/HBoxContainer/TextureButton/VBoxContainer/DescriptionLabel
@onready var slot2_label: RichTextLabel = $MarginContainer/HBoxContainer/TextureButton2/VBoxContainer/DescriptionLabel
@onready var slot3_label: RichTextLabel = $MarginContainer/HBoxContainer/TextureButton3/VBoxContainer/DescriptionLabel

@onready var slot1_texture_rect: TextureRect = $MarginContainer/HBoxContainer/TextureButton/VBoxContainer/TextureRect
@onready var slot2_texture_rect: TextureRect = $MarginContainer/HBoxContainer/TextureButton2/VBoxContainer/TextureRect
@onready var slot3_texture_rect: TextureRect = $MarginContainer/HBoxContainer/TextureButton3/VBoxContainer/TextureRect

var upgrade1: Upgrade
var upgrade2: Upgrade
var upgrade3: Upgrade


func _ready() -> void:
	Global.upgrade_select_screen = self


func set_slots(u1: Upgrade, u2: Upgrade, u3: Upgrade) -> void:
	visible = true
	get_tree().paused = true
	Global.selecting_upgrades = true


	slot1_label.text = u1.description
	slot1_texture_rect.texture = u1.icon
	upgrade1 = u1
	slot2_label.text = u2.description
	slot2_texture_rect.texture = u2.icon
	upgrade2 = u2
	slot3_label.text = u3.description
	slot3_texture_rect.texture = u3.icon
	upgrade3 = u3


func select_upgrade(u: Upgrade) -> void:
	u.apply(get_tree().get_first_node_in_group("Player"))
	visible = false
	get_tree().paused = false
	Global.upgrade_stat += 1
	Global.selecting_upgrades = false


func _on_texture_button_button_up() -> void:
	select_upgrade(upgrade1)


func _on_texture_button_2_button_up() -> void:
	select_upgrade(upgrade2)
	

func _on_texture_button_3_button_up() -> void:
	select_upgrade(upgrade3)
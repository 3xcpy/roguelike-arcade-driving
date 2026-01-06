class_name UpgradeSelectScreen extends Control

@onready var slot1_label: RichTextLabel = $MarginContainer/HBoxContainer/VBoxContainer/Label
@onready var slot2_label: RichTextLabel = $MarginContainer/HBoxContainer/VBoxContainer2/Label
@onready var slot3_label: RichTextLabel = $MarginContainer/HBoxContainer/VBoxContainer3/Label

@onready var slot1_texture_rect: TextureRect = $MarginContainer/HBoxContainer/VBoxContainer/TextureRect
@onready var slot2_texture_rect: TextureRect = $MarginContainer/HBoxContainer/VBoxContainer2/TextureRect
@onready var slot3_texture_rect: TextureRect = $MarginContainer/HBoxContainer/VBoxContainer3/TextureRect

var upgrade1: Upgrade
var upgrade2: Upgrade
var upgrade3: Upgrade


func set_slots(u1: Upgrade, u2: Upgrade, u3: Upgrade) -> void:
	upgrade1 = u1
	upgrade2 = u2
	upgrade3 = u3

	slot1_label.text = u1.description
class_name Main extends Node

@export var stage_scene: PackedScene
@export var pause_menu_scene: PackedScene
@export var main_menu_scene: PackedScene

var stage: Node = null
var pause_menu: Node = null
var main_menu: Node = null


func _ready() -> void:
	main_menu = main_menu_scene.instantiate()
	$UILayer.add_child(main_menu)
	main_menu.connect("start_game", start_game)


func start_game() -> void:
	stage = stage_scene.instantiate()
	pause_menu = pause_menu_scene.instantiate()
	add_child(stage)
	$UILayer.add_child(pause_menu)
	main_menu.queue_free()

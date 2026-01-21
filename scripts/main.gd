class_name Main extends Node

@export var stage_scene: PackedScene
@export var pause_menu_scene: PackedScene
@export var main_menu_scene: PackedScene
@export var upgrade_select_screen_scene: PackedScene

var stage: Node = null
var pause_menu: Node = null
var main_menu: Node = null
var upgrade_select_screen: Node = null


func _ready() -> void:
	create_main_menu()


func start_game() -> void:
	stage = stage_scene.instantiate()
	add_child(stage)
	pause_menu = pause_menu_scene.instantiate()
	$UILayer.add_child(pause_menu)
	pause_menu.connect("quit_to_menu", quit_to_menu)
	upgrade_select_screen = upgrade_select_screen_scene.instantiate()
	$UILayer.add_child(upgrade_select_screen)
	main_menu.queue_free()


func quit_to_menu() -> void:
	stage.queue_free()
	pause_menu.queue_free()
	upgrade_select_screen.queue_free()
	create_main_menu()


func create_main_menu() -> void:
	main_menu = main_menu_scene.instantiate()
	$UILayer.add_child(main_menu)
	main_menu.connect("start_game", start_game)

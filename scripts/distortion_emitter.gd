class_name DistortionEmitter extends Node2D

@export var weight: float = 0.1

var active: bool = false
var index: int


func _ready() -> void:
	index = Global.floor.get_valid_index()
	if index != -1:
		active = true


func _physics_process(_delta: float) -> void:
	if active:
		Global.floor.set_weight_and_position(index, weight, global_position)

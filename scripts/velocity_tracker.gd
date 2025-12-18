class_name VelocityTracker extends Node2D

var prev_pos: Vector2
var velocity: Vector2


func _ready() -> void:
	prev_pos = global_position


func _physics_process(_delta: float) -> void:
	prev_pos = global_position


func update_velocity() -> void:
	velocity = global_position - prev_pos

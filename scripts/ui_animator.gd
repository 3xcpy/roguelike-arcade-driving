class_name UIAnimator extends Node

@export var hover_scale: Vector2 = Vector2(1.0, 1.0)
@export var time: float = 0.1
@export var transition_type: Tween.TransitionType
@export var ease_type: Tween.EaseType


func _ready() -> void:
	get_tree().connect("node_added", _on_tree_node_added)


func _on_tree_node_added(node: Node) -> void:
	if node is Button:
		add_target(node)


func on_hover(target: Control) -> void:
	add_tween(target, "scale", hover_scale, time)
	print("on_hover: ", target)
	

func off_hover(target: Control) -> void:
	add_tween(target, "scale", Vector2.ONE, time)


func add_target(target: Control) -> void:
	var a = func(): on_hover(target)
	target.mouse_entered.connect(a)
	var b = func(): off_hover(target)
	target.mouse_exited.connect(b)
	var c = func(): setup_target(target)
	c.call_deferred()


func setup_target(target: Control) -> void:
	target.pivot_offset = target.size / 2


func add_tween(target: Node, property: String, value, duration: float) -> void:
	if get_tree():
		var tween = get_tree().create_tween()
		tween.set_pause_mode(Tween.TWEEN_PAUSE_PROCESS)
		tween.tween_property(target, property, value, duration).set_trans(transition_type).set_ease(ease_type)
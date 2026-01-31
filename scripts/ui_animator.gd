class_name UIAnimator extends Node

@export_group("Movement")
@export var hover_scale: Vector2 = Vector2(1.0, 1.0)
@export var hover_rotation: float = 0.0
@export var time: float = 0.1
@export var transition_type: Tween.TransitionType
@export var ease_type: Tween.EaseType

@export_group("Audio")
@export var hover_sound: Resource = null
@export var click_sound: Resource = null

var _playback: AudioStreamPlaybackPolyphonic


func _ready() -> void:
	var asp = AudioStreamPlayer.new()
	asp.bus = &"SFX"
	add_child(asp)
	var stream = AudioStreamPolyphonic.new()
	stream.polyphony = 16
	asp.stream = stream
	asp.play()
	_playback = asp.get_stream_playback()

	get_tree().connect("node_added", _on_tree_node_added)


func _on_tree_node_added(node: Node) -> void:
	if node is BaseButton:
		add_target(node)


func on_hover(target: Control) -> void:
	if hover_sound != null:
		_playback.play_stream(hover_sound, 0, 0, randf_range(0.9, 1.1))

	var t := get_tween()
	if t:
		t.tween_property(target, "scale", hover_scale, time)
		t.tween_property(target, "rotation_degrees", hover_rotation, time)
	

func off_hover(target: Control) -> void:
	var t := get_tween()
	if t:
		t.tween_property(target, "scale", Vector2.ONE, time)
		t.tween_property(target, "rotation_degrees", 0.0, time)


func _on_button_up() -> void:
	if click_sound != null:
		_playback.play_stream(click_sound, 0, 0, randf_range(0.9, 1.1))


func add_target(target: Control) -> void:
	print(target)
	var a = func(): on_hover(target)
	target.mouse_entered.connect(a)
	var b = func(): off_hover(target)
	target.mouse_exited.connect(b)
	target.button_up.connect(_on_button_up)
	var c = func(): setup_target(target)
	c.call_deferred()


func setup_target(target: Control) -> void:
	target.pivot_offset = target.size / 2


func add_tween(target: Node, property: String, value, duration: float) -> void:
	if get_tree():
		var tween = get_tree().create_tween()
		tween.set_pause_mode(Tween.TWEEN_PAUSE_PROCESS)
		tween.tween_property(target, property, value, duration).set_trans(transition_type).set_ease(ease_type)


func get_tween() -> Tween:
	if get_tree():
		var tween = get_tree().create_tween()
		tween.set_pause_mode(Tween.TWEEN_PAUSE_PROCESS).set_trans(transition_type).set_ease(ease_type)
		return tween
	return null

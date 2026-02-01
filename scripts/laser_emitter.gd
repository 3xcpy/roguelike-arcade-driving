class_name LaserEmitter extends Node2D

@export var active: bool = false

@export var lasers_per_second: int = 2

@export var damage: float = 1.0
@export var laser: PackedScene
@export var reach: float = 256.0

@export var shooting_sound: Resource = null

var timer: float = 0.0
var audio_playback: AudioStreamPlaybackPolyphonic

func _ready() -> void:
	if shooting_sound != null:
		var asp = AudioStreamPlayer.new()
		asp.bus = &"SFX"
		add_child(asp)

		var stream = AudioStreamPolyphonic.new()
		stream.polyphony = 16	
		asp.stream = stream
		asp.play()
		audio_playback = asp.get_stream_playback()


func shoot(target: Vector2) -> void:
	if shooting_sound != null:
		audio_playback.play_stream(shooting_sound, 0, 0, randf_range(0.9, 1.1))
	var laser_instance: Laser = laser.instantiate()
	add_child(laser_instance)
	laser_instance.global_position = global_position
	laser_instance.init(global_position.direction_to(target) * reach + global_position)


func _physics_process(delta: float) -> void:
	global_rotation = 0.0
	timer += delta
	if timer >= 1.0/float(lasers_per_second):
		timer = 0.0
		var enemies = get_tree().get_nodes_in_group("Enemies")
		var min_dist: float = 1e300
		var nearest: Node2D = null
		for e: Node2D in enemies:
			var dist = global_position.distance_to(e.global_position)
			if dist < min_dist:
				min_dist = dist
				nearest = e
		
		if nearest and min_dist <= reach:
			shoot(nearest.global_position)

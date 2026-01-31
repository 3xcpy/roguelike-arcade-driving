class_name HealthComponent extends Node

signal damaged(damage: float)
signal healed(amount: float)
signal dead

@export var max_health: float = 10.0
@export var hurt_sound: Resource = null
@export var heal_sound: Resource = null

var health: float = max_health

var audio_playback: AudioStreamPlaybackPolyphonic

func _ready() -> void:
	if hurt_sound != null:
		var asp = AudioStreamPlayer.new()
		asp.bus = &"SFX"
		add_child(asp)

		var stream = AudioStreamPolyphonic.new()
		stream.polyphony = 16	
		asp.stream = stream
		asp.play()
		audio_playback = asp.get_stream_playback()


func damage(dmg: float) -> void:
	health -= dmg
	if health <= 0:
		dead.emit()
	else:
		if hurt_sound != null:
			audio_playback.play_stream(hurt_sound, 0, 0, randf_range(0.9, 1.1))
	damaged.emit(dmg)


func heal(amount: float) -> void:
	health += amount
	if health > max_health:
		health = max_health
	if heal_sound != null:
		audio_playback.play_stream(heal_sound, 0, 0, randf_range(0.9, 1.1), AudioServer.PlaybackType.PLAYBACK_TYPE_DEFAULT, &"SFX")
	healed.emit(amount)
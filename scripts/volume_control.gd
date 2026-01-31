class_name VolumeControl extends VSlider

@export var bus_name: StringName = "Master"

var _bus: int


func _ready() -> void:
	_bus = AudioServer.get_bus_index(bus_name)
	value = AudioServer.get_bus_volume_linear(_bus)
	value_changed.connect(_on_value_changed)


func _on_value_changed(new_value: float) -> void:
	AudioServer.set_bus_volume_linear(_bus, new_value)
	print("set audio level")

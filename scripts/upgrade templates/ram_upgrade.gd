class_name RamUpgrade extends Upgrade

@export var radius: float = 0.0
@export var radius_multiplier: float = 0.0
@export var damage: float = 0.0
@export var damage_multiplier: float = 0.0


func apply(player: Player):
	if radius > 0.0:
		player.ram.radius += radius
	if radius_multiplier > 0.0:
		player.ram.radius = player.ram.radius * radius_multiplier
	if damage > 0.0:
		player.ram.damage += damage
	if damage_multiplier > 0.0:
		player.ram.damage = player.ram.damage * damage_multiplier
	player.ram.update_values()
class_name RamUpgrade extends Upgrade

@export var radius: float = 0.0
@export var damage: float = 0.0


func apply(player: Player):
	if radius > 0.0:
		player.ram.radius += radius
	if damage > 0.0:
		player.ram.damage += damage
	player.ram.update_values()
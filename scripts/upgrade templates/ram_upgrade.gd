class_name RamUpgrade extends Upgrade

@export var radius: float = 0.0
@export var radius_multiplier: float = 0.0
@export var damage: float = 0.0
@export var damage_multiplier: float = 0.0


func apply(player: Player):
	if radius > 0.0:
		player.aura.radius += damage
	if radius_multiplier > 0.0:
		player.aura.radius = player.aura.damage * damage_multiplier
	if damage > 0.0:
		player.aura.damage += damage
	if damage_multiplier > 0.0:
		player.aura.damage = player.aura.damage * damage_multiplier
	player.ram.update_values()
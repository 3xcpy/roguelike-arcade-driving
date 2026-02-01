class_name AuraUpgrade extends Upgrade

@export var radius: float = 0.0
@export var damage: float = 0.0


func apply(player: Player):
	if radius > 0.0:
		player.aura.radius += radius
	if damage > 0.0:
		player.aura.damage += damage
	player.aura.update_values()
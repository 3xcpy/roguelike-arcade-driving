class_name DamageAreaUpgradeTemplate extends Upgrade

@export var damage: float = 0.0
@export var spawns_per_second: float = 0.0
@export var radius: float = 0.0


func apply(player: Player):
	if damage > 0.0:
		player.damage_area_spawner.damage += damage
	if spawns_per_second > 0.0:
		player.damage_area_spawner.spawns_per_second += spawns_per_second
	if radius > 0.0:
		player.damage_area_spawner.radius += radius
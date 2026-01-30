class_name PlayerUpgradeTemplate extends Upgrade

@export var health: float = 0.0


func apply(player: Player):
	if health > 0.0:
		player.health_component.max_health += health
		player.health_component.health += health
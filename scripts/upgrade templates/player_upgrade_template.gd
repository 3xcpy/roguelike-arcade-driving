class_name PlayerUpgradeTemplate extends Upgrade

@export var health: float = 0.0
@export var healing: float = 0.0


func apply(player: Player):
	if health > 0.0:
		player.health_component.max_health += health
		player.health_component.health += health
	if healing > 0.0:
		player.health_per_10_seconds += healing
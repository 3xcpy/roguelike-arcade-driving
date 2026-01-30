class_name LaserUpgradeTemplate extends Upgrade

@export var lasers_per_second: int = 0
@export var damage: int = 0
@export var distance: float = 0.0


func apply(player: Player) -> void:
	if lasers_per_second > 0:
		player.laser_emitter.lasers_per_second += lasers_per_second
	if damage > 0:
		player.laser_emitter.damage += damage
	if distance > 0:
		player.laser_emitter.reach += distance
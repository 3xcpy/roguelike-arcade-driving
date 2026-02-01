class_name EyeballUpgrade extends Upgrade

@export var amount: int = 0
@export var damage: float = 0.0
@export var distance: float = 0.0
@export var rotation_speed: float = 0.0

func apply(player: Player):
	if amount > 0:
		player.eyeballs.amount += amount
	if damage > 0.0:
		player.eyeballs.damage += damage
	if distance > 0.0:
		player.eyeballs.distance += distance
	if rotation_speed > 0.0:
		player.eyeballs.rotation_speed += rotation_speed
	player.eyeballs.set_amount()
class_name EyeballUpgrade extends Upgrade

@export var amount: int = 0
@export var amount_multiplier: float = 0.0
@export var damage: float = 0.0
@export var damage_multiplier: float = 0.0
@export var distance: float = 0.0
@export var distance_multiplier: float = 0.0
@export var rotation_speed: float = 0.0
@export var rotation_speed_multiplier: float = 0.0

func apply(player: Player):
	if amount > 0:
		player.eyeballs.amount += amount
	if amount_multiplier > 0.0:
		player.eyeballs.amount = int(player.eyeballs.amount * amount_multiplier)
	if damage > 0.0:
		player.eyeballs.damage += damage
	if damage_multiplier > 0.0:
		player.eyeballs.damage = player.eyeballs.damage * damage_multiplier
	if distance > 0.0:
		player.eyeballs.distance += distance
	if distance_multiplier > 0.0:
		player.eyeballs.distance = player.eyeballs.distance * distance_multiplier
	if rotation_speed > 0.0:
		player.eyeballs.rotation_speed += rotation_speed
	if rotation_speed_multiplier > 0.0:
		player.eyeballs.rotation_speed = player.eyeballs.rotation_speed * rotation_speed_multiplier
	player.eyeballs.set_amount()
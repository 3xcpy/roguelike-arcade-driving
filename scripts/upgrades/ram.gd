extends Upgrade

func apply(player: Player):
	player.ram.radius += 16
	player.ram.update_values()
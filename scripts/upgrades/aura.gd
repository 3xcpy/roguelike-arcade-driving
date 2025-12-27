extends Upgrade

func apply(player: Player):
	player.aura.radius += 16
	player.aura.update_values()
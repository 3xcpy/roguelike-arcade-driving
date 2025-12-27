extends Upgrade

func apply(player: Player):
	player.eyeballs.amount += 1
	player.eyeballs.set_amount()
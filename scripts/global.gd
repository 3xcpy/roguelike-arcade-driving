extends Node

var ground: Floor = null
var game_manager: GameManager = null
var upgrade_select_screen: UpgradeSelectScreen = null
var player: Player = null

var selecting_upgrades: bool = false

var current_index: int = 0
func get_enemy_index() -> int:
	current_index += 1
	return current_index - 1

var enemy_stat: int = 0
var upgrade_stat: int = 0
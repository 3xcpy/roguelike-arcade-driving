class_name HealthComponent extends Node

signal damaged(damage: float)
signal healed(amount: float)
signal dead

@export var max_health: float = 10.0
var health: float = max_health


func damage(dmg: float) -> void:
	health -= dmg
	if health <= 0:
		dead.emit()
	damaged.emit(dmg)


func heal(amount: float) -> void:
	health += amount
	if health > max_health:
		health = max_health
	healed.emit(amount)
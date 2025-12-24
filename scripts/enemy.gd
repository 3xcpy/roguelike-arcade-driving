class_name Enemy extends Area2D

@export var attack_damage: float = 1.0

var tick: float = 0.1
var timer := 0.0


func _physics_process(delta: float) -> void:
	timer += delta
	if timer >= tick:
		timer = 0.0
		var overlapping_bodies = get_overlapping_bodies()
		for b in overlapping_bodies:
			if b.is_in_group("Player"):
				if b.has_method("damage"):
					b.damage(attack_damage)


func damage(dmg: float): $HealthComponent.damage(dmg)


func _on_health_component_dead() -> void:
	queue_free()


func _on_health_component_damaged(_dmg: float) -> void:
	$DamageParticles.emitting = true
	$DamageParticles.restart()
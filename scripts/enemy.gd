class_name Enemy extends Area2D

func damage(dmg: float): $HealthComponent.damage(dmg)

func _on_health_component_dead() -> void:
	queue_free()


func _on_health_component_damaged(_dmg: float) -> void:
	$GPUParticles2D.emitting = true
	$GPUParticles2D.restart()
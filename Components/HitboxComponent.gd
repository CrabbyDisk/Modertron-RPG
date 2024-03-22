extends Area2D
class_name HitboxComponent

@export var health_component : HealthComponent

func DamageRecieved(damage : int):
	health_component.damage(damage)

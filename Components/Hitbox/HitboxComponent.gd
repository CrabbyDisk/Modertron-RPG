extends Area2D
class_name HitboxComponent

@export var Health_Component : HealthComponent

func DamageRecieved(Damage : int):
	Health_Component.DamageTaken(Damage)

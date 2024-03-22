extends Node2D
class_name HealthComponent

@export var Health : float
@export var Defense : float

func DamageTaken(DamageAmount : int):
	#Code for calculating damage
	if Defense <= 0:
		Health -= DamageAmount
	else:
		Defense -= DamageAmount
	
	# Code for dying
	if Health <= 0:
		get_parent().queue_free()

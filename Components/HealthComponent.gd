extends Node
class_name HealthComponent

@export var health : float
@export var defense : float

func damage(amount : int):
	#Code for calculating damage
	if defense <= 0:
		health -= amount
	else:
		defense -= amount
	
	# Code for dying
	if health <= 0:
		get_parent().queue_free()

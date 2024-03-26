extends Node
class_name HealthComponent

@export var health : float
@export var defense : float

signal damaged

func damage(amount : int):
	#Code for calculating damage
	if defense <= 0:
		health -= amount
		damaged.emit()
	else:
		defense -= amount
		damaged.emit()
	
	##TODO: When the player dies put the player in a death screen
	# Code for dying
	if health <= 0 and not get_parent() is Player:
		get_parent().queue_free()

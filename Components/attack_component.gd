extends Area2D
class_name AttackComponent

@export var damage : int

## ATTENTION: This isn't done yet
func _on_hitbox_entered(area):
	if area is HitboxComponent:
		area.DamageRecieved(damage)

extends CharacterBody2D
class_name Player

const speed : int = 200
static var mana : int = 10

func _physics_process(delta):
	var input_dir = Input.get_vector("left", "right", "up", "down")
	velocity = input_dir * speed
	if input_dir:
		$AnimatedSprite2D.flip_h = true if input_dir.x == -1 else false
		$AnimatedSprite2D.play("walk")
	else:
		$AnimatedSprite2D.play("idle")
	
	move_and_slide()

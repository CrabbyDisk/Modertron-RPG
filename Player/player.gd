extends CharacterBody2D

const speed : int = 200
static var mana : int = 10

func _physics_process(delta):
	var input_dir = Input.get_vector("left", "right", "up", "down")
	velocity = input_dir * speed
	
	move_and_slide()

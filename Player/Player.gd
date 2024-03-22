extends CharacterBody2D

const Speed : int = 300

func _physics_process(delta):
	var Direction_X = Input.get_axis("Left", "Right")
	var Direction_Y = Input.get_axis("Up", "Down")
	velocity.x = Speed * Direction_X
	velocity.y = Speed * Direction_Y
	
	move_and_slide()

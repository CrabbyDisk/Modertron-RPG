extends CharacterBody2D
class_name Player

const speed : int = 200
static var mana : int = 10

func _ready():
	$AttackComponent/AnimatedSprite2D.hide()
	$AttackComponent/CollisionShape2D.disabled = true

func _physics_process(delta):
	var input_dir = Input.get_vector("left", "right", "up", "down")
	velocity = input_dir * speed
	if input_dir:
		$AnimatedSprite2D.flip_h = true if input_dir.x == -1 else false
		$AnimatedSprite2D.play("walk")
		$AttackComponent.look_at(global_position - input_dir * -1)
	else:
		$AnimatedSprite2D.play("idle")
	
	move_and_slide()
	
	if Input.is_action_just_pressed("attack"):
		$AttackComponent/AnimatedSprite2D.show()
		$AttackComponent/CollisionShape2D.disabled = false
		$AttackComponent/AnimatedSprite2D.play("attack")
		await $AttackComponent/AnimatedSprite2D.animation_finished
		$AttackComponent/CollisionShape2D.disabled = true
		$AttackComponent/AnimatedSprite2D.hide()


func _on_damaged():
	$AnimatedSprite2D.modulate = "ff0000"
	await get_tree().create_timer(0.5).timeout
	$AnimatedSprite2D.modulate = "ffffff"

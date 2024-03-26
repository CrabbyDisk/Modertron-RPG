extends CharacterBody2D

@export var player: CharacterBody2D

@onready var pathfinding = $PathfindComponent
const SPEED = 150.0
func _ready():
	pathfinding.target = player
	pathfinding.parent = self

func _physics_process(delta):
	velocity = lerp(velocity, pathfinding.get_dir() * SPEED, .1)
	move_and_slide()
	
func _on_damaged():
	$Sprite2D.modulate = "ff0000"
	await get_tree().create_timer(0.5).timeout
	$Sprite2D.modulate = "ffffff"

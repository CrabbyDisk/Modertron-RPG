extends CharacterBody2D

@onready var pathfinding = $PathfindComponent
const SPEED = 300.0
func _on_ready():
	
func _physics_process(delta):
	pathfinding.target = 
	move_and_slide()

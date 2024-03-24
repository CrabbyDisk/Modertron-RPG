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

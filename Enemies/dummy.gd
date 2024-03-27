extends CharacterBody2D

const SPEED = 150.0

var player_agent = GSAISteeringAgent.new()

@onready var agent := await GSAICharacterBody2DAgent.new(self, 1)
@onready var accel := GSAITargetAcceleration.new()


@onready var pursue := GSAIPursue.new(agent, player_agent)

func _ready():
	agent.linear_acceleration_max = 100
	agent.linear_speed_max = 100
func _physics_process(delta):
	if not player_agent:
		return
	pursue._calculate_steering(accel)
	agent._apply_steering(accel, delta)
	
	
func _on_damaged():
	$Sprite2D.modulate = "ff0000"
	await get_tree().create_timer(0.5).timeout
	$Sprite2D.modulate = "ffffff"

extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	for child in $Dummies.get_children():
		child.player_agent = $Player.agent


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	for child in $Dummies.get_children():
		child.player_agent = $Player.agent

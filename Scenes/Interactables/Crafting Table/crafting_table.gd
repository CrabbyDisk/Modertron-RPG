extends StaticBody2D

@export var craftable_items : Array[CraftableItem]

@onready var key = $Key
@onready var ui = $CanvasLayer/UI

var can_interact = false

func _ready():
	key.hide()
	ui.hide()

func _process(delta):
	if Input.is_action_just_pressed("interact") and can_interact == true:
		ui.visible = !ui.visible
		get_tree().paused = ui.visible

func _on_interactable_area_entered(body):
	key.show()
	can_interact = true

func _on_interactable_area_exited(body):
	key.hide()
	can_interact = false

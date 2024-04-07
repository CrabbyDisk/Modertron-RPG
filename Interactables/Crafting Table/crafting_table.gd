extends StaticBody2D

@export var craftable_items : Array[CraftableItem]

@onready var key = $Key
@onready var ui = $CanvasLayer/UI


func _on_interactable_activated():
	key.show()


func _on_interactable_deactivated():
	key.hide()


func _on_interactable_used():
	ui.visible = !ui.visible
	get_tree().paused = ui.visible

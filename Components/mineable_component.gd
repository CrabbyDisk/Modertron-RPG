extends Node

@export var item : InventoryItem
@export var amount_min : int
@export var amount_max : int

var inventory_data := preload("res://Resources/Inventory Resources/PlayerInventory.tres")

func _on_object_mined():
	for i in randi_range(amount_min, amount_max):
		inventory_data.items.append(item)

extends Control

@onready var slot_count := $NinePatchRect/GridContainer.get_child_count()
var inventory_data := preload("res://Resources/PlayerInventory.tres")
var inventory_item_count := inventory_data.items.size()

func update_inventory():
	for i in min(inventory_item_count, slot_count):
		print(i)
		get_node("NinePatchRect/GridContainer/InventorySlot" + str(i + 1) + "/Item").texture = inventory_data.items[i].texture if not inventory_data.items[i] == null else null 
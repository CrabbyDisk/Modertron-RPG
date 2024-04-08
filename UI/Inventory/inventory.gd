extends Control

@onready var slot_count := $NinePatchRect/GridContainer.get_child_count()
var inventory_data := preload("res://Resources/Inventory Resources/PlayerInventory.tres")

func update_inventory():
	var inventory_item_count := inventory_data.items.size()
	for i in min(inventory_item_count, slot_count):
		get_node("NinePatchRect/GridContainer/InventorySlot" + str(i + 1) + "/Item").texture = inventory_data.items[i].texture if not inventory_data.items[i] == null else null 

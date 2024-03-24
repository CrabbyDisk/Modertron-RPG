extends Control

var inventory_is_showing := false

func _ready():
	$Inventory.hide()
	$Pause.hide()

func _process(delta):
	## NOTE: Make sure to always make the player node a unique name or this code won't work
	$Health.value = %Player/HealthComponent.health
	$Mana.value = %Player.mana
	
	if Input.is_action_just_pressed("inventory"):
		inventory_is_showing = !inventory_is_showing
		$Inventory.visible = inventory_is_showing
		get_tree().paused = inventory_is_showing
	
	
	if Input.is_action_just_pressed("return"):
		if inventory_is_showing == true:
			inventory_is_showing = false
			$Inventory.hide()
			get_tree().paused = false
		else:
			$Pause.visible = !get_tree().paused
			get_tree().paused = !get_tree().paused


func _on_quit_pressed():
	## FIXME: This should probably bring you to the main menu instead of directly quitting
	get_tree().quit()

func _on_resume_pressed():
	$Pause.hide()
	get_tree().paused = false


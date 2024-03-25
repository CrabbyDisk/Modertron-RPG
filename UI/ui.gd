extends Control

var inventory_is_showing := false

@onready var inventory = $Inventory
@onready var pause = $Pause
@onready var player = %Player
@onready var health_bar = $HealthBar
@onready var mana_bar = $ManaBar

func _ready():
	inventory.hide()
	pause.hide()

func _process(delta):
	## NOTE: Make sure to always make the player node a unique name or this code won't work
	health_bar.value = player.get_node("HealthComponent").health
	mana_bar.value = player.mana
	
	if Input.is_action_just_pressed("inventory"):
		inventory_is_showing = !inventory_is_showing
		inventory.visible = inventory_is_showing
		get_tree().paused = inventory_is_showing
	
	
	if Input.is_action_just_pressed("return"):
		if inventory_is_showing == true:
			inventory_is_showing = false
			inventory.hide()
			get_tree().paused = false
		else:
			pause.visible = !get_tree().paused
			get_tree().paused = !get_tree().paused


func _on_quit_pressed():
	## FIXME: This should probably bring you to the main menu instead of directly quitting
	get_tree().quit()

func _on_resume_pressed():
	pause.hide()
	get_tree().paused = false


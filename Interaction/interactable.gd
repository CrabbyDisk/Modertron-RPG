extends Area2D
class_name Interactable

@onready var manager = $"/root/InteractionManager"

signal activated
signal deactivated
signal used

func _ready():
	body_entered.connect(_entered)
	body_exited.connect(_exited)

func _entered(body):
	if body is Player:
		manager.register(self)

func _exited(body):
	if body is Player:
		manager.unregister(self)
	
func activate():
	activated.emit()
	
func deactivate():
	deactivated.emit()

func use():
	used.emit()

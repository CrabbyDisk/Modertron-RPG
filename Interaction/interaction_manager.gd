extends Node

var interactables: Array[Interactable]
var active: Interactable

var player: Player

func _input(event):
	if event.is_action_pressed("interact") and active:
		active.use()


func _ready():
	process_mode = Node.PROCESS_MODE_ALWAYS
	player = get_tree().get_current_scene().get_node("Player")


func _process(delta):
	if not player:
		return
	update_list()

func update_list():
	if interactables.is_empty():
		if active:
			active.deactivate()
			active = null
		return
	interactables.sort_custom(sort_interactables)
	if active != interactables[0]:
		active.deactivate() if active else null
		active = interactables[0]
		active.activate()


func sort_interactables(a, b):
	var player_pos = player.position
	var dist_a = player_pos.distance_to(a)
	var dist_b = player_pos.distance_to(b)
	return dist_a < dist_b


func register(obj: Interactable):
	interactables.append(obj)
	update_list()


func unregister(obj: Interactable):
	interactables.remove_at(interactables.find(obj))
	update_list()

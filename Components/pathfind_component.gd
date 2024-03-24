extends NavigationAgent2D
class_name PathfindComponent

@export var target : Node2D
@export var parent: Node2D

func get_dir():
	var direction: Vector2
	target_position = target.global_position
	if target.global_position.distance_to(parent.global_position) > 80:
		direction = get_next_path_position() - parent.global_position
	else:
		direction = parent.global_position - get_next_path_position()
	direction = direction.normalized()
	return direction

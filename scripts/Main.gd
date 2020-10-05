extends Node2D

onready var nav_2d = $Navigation2D
onready var line_2d = $Line2D
onready var character = $Character

#			$Navigation2D.navpoly_add(np, xform)
#	print(polygon)

func _unhandled_input(event: InputEvent):
	if not event is InputEventMouseButton or \
		event.button_index != BUTTON_LEFT or not event.pressed:
		return
	
	var new_path = nav_2d.get_simple_path(character.global_position, get_global_mouse_position(), true)
	
	
	line_2d.points = new_path
	character.path = new_path

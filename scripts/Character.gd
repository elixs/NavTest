extends KinematicBody2D

var SPEED = 300

var linear_vel = Vector2()

var path = PoolVector2Array() setget set_path
func set_path(value):
	path = value
	if value.size() == 0:
		return
	set_physics_process(true)
	
func _ready():
	set_physics_process(false)

func _physics_process(delta):
	if path.size() == 0:
		return
	var target = path[0]
	var remaining = move_to(target, delta)
	
	while path.size() > 1 and remaining > 0:
		path.remove(0)
		target = path[0]
		remaining = move_to(target, remaining)
		
		

func move_to(target, delta):
	var diff = target - position
	var dist = diff.length()
	var dir = Vector2() if dist == 0 else diff/dist
	var factor = min(dist / (SPEED * delta), 1)
	move_and_slide(dir * SPEED * factor)
	return (1 - factor) * delta

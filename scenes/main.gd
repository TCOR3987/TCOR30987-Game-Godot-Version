extends Node2D

func _process(delta):
	var mouse = get_global_mouse_position()
	if Input.is_action_just_pressed("left_click"):
		if Input.is_action_pressed("shift"):
			SignalBus.emit_signal("waypoint_change", mouse)
			pass
	pass

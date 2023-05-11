extends Area2D

class_name ComponentSelect

var selected:bool = false

func _on_input_event(viewport, event, shape_idx):
	if Input.is_action_pressed("left_click") == true:
		selected = !selected
		pass
	pass # Replace with function body.

Something

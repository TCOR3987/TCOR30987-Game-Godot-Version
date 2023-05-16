extends Area2D

class_name ComponentSelect

@export var selected:bool = false

func _on_input_event(viewport, event, shape_idx):
	if Input.is_action_pressed("left_click") == true:
		SignalBus.emit_signal("deselect_entities")
		selected = true
		pass
	pass # Replace with function body.

func _ready():
	SignalBus.connect("deselect_entities", _deselect_entity)

func _deselect_entity():
	selected = false

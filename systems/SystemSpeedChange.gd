extends Node2D

class_name SystemSpeedChange

@export var component_speed:ComponentSpeed
@export var component_select:ComponentSelect

func _ready():
	SignalBus.connect("speed_change", _speed_change)
	
func _speed_change(value:int):
	if component_select.selected == true:
		component_speed.setting = value

extends Node

var selected_unit = []
var selected_player_units = []


func _process(delta):
	if Input.is_action_just_pressed("right_click"):
		if Input.is_action_pressed("shift"):
			for unit in selected_player_units:
				
	pass

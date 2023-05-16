extends Area2D

class_name ComponentSelect

@export var selected:bool = false
var id:int

func _on_input_event(viewport, event, shape_idx):
	if Globals.ship_combat_ability == Globals.ship_combat_enum_abilities.none:
		if selected == false:
			if Input.is_action_pressed("left_click") == true:
				SignalBus.emit_signal("deselect_entities")
				selected = true
	if Globals.ship_combat_ability == Globals.ship_combat_enum_abilities.missile:
		SignalBus.emit_signal("fire_missile", id)
	pass # Replace with function body.

func _ready():
	id = get_instance_id()
	SignalBus.connect("deselect_entities", _deselect_entity)

func _deselect_entity():
	selected = false

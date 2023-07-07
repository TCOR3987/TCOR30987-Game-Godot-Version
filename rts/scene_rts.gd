extends Node2D

class_name SceneShipCombat

var carrier_template = preload("res://rts/entities/carrier/RtsEntityCarrier.tscn")

@export var selected_scene:ComponentSceneSelect


func _process(delta):
	if selected_scene.current_scene == selected_scene.scene_enums.ship_combat:
		var mouse = get_global_mouse_position()
		$CanvasLayer.visible = true
		self.visible = true
		if Input.is_action_just_pressed("left_click"):
			if Globals.ship_combat_ability == Globals.ship_combat_enum_abilities.waypoint_set:
				SignalBus.emit_signal("waypoint_change", mouse)
				Globals.ship_combat_ability = Globals.ship_combat_enum_abilities.none
			if Globals.ship_combat_ability == Globals.ship_combat_enum_abilities.waypoint_add:
				SignalBus.emit_signal("waypoint_add", mouse)
				Globals.ship_combat_ability = Globals.ship_combat_enum_abilities.none
			if Globals.ship_combat_ability == Globals.ship_combat_enum_abilities.missile:
#				SignalBus.emit_signal("fire_missile")
				Globals.ship_combat_ability = Globals.ship_combat_enum_abilities.none
		pass
	else:
		self.visible = false
		$CanvasLayer.visible = false

func _on_set_button_up():
	Globals.ship_combat_ability = Globals.ship_combat_enum_abilities.waypoint_set
	pass # Replace with function body.

func _on_add_button_up():
	Globals.ship_combat_ability = Globals.ship_combat_enum_abilities.waypoint_add
	pass # Replace with function body.

func _on_stop_button_up():
	SignalBus.emit_signal("waypoints_clear")
	pass # Replace with function body.

func _on_speed_0_button_up():
	SignalBus.emit_signal("speed_change", 0)
	pass # Replace with function body.

func _on_speed_1_button_up():
	SignalBus.emit_signal("speed_change", 1)
	pass # Replace with function body.

func _on_speed_2_button_up():
	SignalBus.emit_signal("speed_change", 2)
	pass # Replace with function body.

func _on_speed_3_button_up():
	SignalBus.emit_signal("speed_change", 3)
	pass # Replace with function body.

func _on_speed_4_button_up():
	SignalBus.emit_signal("speed_change", 4)
	pass # Replace with function body.

func _on_speed_5_button_up():
	SignalBus.emit_signal("speed_change", 5)
	pass # Replace with function body.

func _on_missile_button_up():
	Globals.ship_combat_ability = Globals.ship_combat_enum_abilities.missile
	pass # Replace with function body.

func _ready():
	spawn_player_carrier(1)

func spawn_player_carrier(v:int):
	var new_carrier = carrier_template.instantiate()
	new_carrier.set_team(1)
	self.add_child(new_carrier)
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

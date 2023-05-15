extends Node2D

class_name SceneShipCombat

@export var selected_scene:ComponentSceneSelect

func _process(delta):
	if selected_scene.current_scene == selected_scene.scene_enums.ship_combat:
		$CanvasLayer.visible = true
		self.visible = true
		var mouse = get_global_mouse_position()
		if Input.is_action_just_pressed("left_click"):
			if Input.is_action_pressed("shift"):
				SignalBus.emit_signal("waypoint_change", mouse)
				pass
		pass
	else:
		self.visible = false
		$CanvasLayer.visible = false

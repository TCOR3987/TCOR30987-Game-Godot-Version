extends Node2D

func _process(delta):
	if Input.is_action_just_pressed("g"):
		$ComponentSceneSelect.current_scene = $ComponentSceneSelect.scene_enums.shipyard
		pass
	if Input.is_action_just_pressed("h"):
		$ComponentSceneSelect.current_scene = $ComponentSceneSelect.scene_enums.ship_combat
		pass

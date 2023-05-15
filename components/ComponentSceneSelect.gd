extends Node2D

class_name ComponentSceneSelect

enum scene_enums {
	ship_combat,
	shipyard,
	bio_habitat,
	production,
	map,
	hacking,
	grand_stategy,
}
@export var current_scene:scene_enums = scene_enums.ship_combat


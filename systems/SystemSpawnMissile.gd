extends Node2D

class_name SystemSpawnMissile
var preload_missile = preload("res://entities/missile/EntityMissile.tscn")

@export var component_transform:ComponentTransform
@export var component_target:ComponentTarget
@export var component_select:ComponentSelect

# Called when the node enters the scene tree for the first time.
func _ready():
	SignalBus.connect("fire_missile", fire_missile)
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func fire_missile(instance_id):
	if component_select.selected == true:
		var new_missile = preload_missile.instantiate()
		new_missile.transform = component_transform.transform
		new_missile.

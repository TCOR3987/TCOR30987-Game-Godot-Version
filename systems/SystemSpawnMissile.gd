extends Node2D

class_name SystemSpawnMissile

var missile_template = preload("res://entities/missile/EntityMissile.tscn")
@export var component_select:ComponentSelect

func _ready():
	SignalBus.connect("fire_missile", fire_missile)
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func fire_missile(id):
	if component_select.selected == true:
		var new_missile = missile_template.instantiate()
		new_missile.set_transform_(self.global_position)
		new_missile.set_target(id)
		get_parent().get_parent().add_child(new_missile)

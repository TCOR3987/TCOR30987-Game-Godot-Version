extends Node2D

class_name ComponentId

var id:int

# Called when the node enters the scene tree for the first time.
func _ready():
	id = get_parent().get_instance_id()
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

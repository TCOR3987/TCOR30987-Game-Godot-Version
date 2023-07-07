extends Node2D

class_name ComponentHitpoints

enum enum_state {
	alive,
	dead
}

var state = enum_state.alive
@export var hitpoints_current:float = 100
@export var hitpoints_max:float = 100
@export var component_id:ComponentId

# Called when the node enters the scene tree for the first time.
func _ready():
	SignalBus.connect("damage_target", damage_self)
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if hitpoints_current <= 0:
		state = enum_state.dead
		get_parent().queue_free()
	pass

func damage_self(target_id,damage):
	if get_parent() == target_id:
		hitpoints_current -= damage

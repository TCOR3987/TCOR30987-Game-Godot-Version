extends Node2D

class_name SystemMovementNonFuel

@export var component_waypoints:ComponentWaypoints
@export var component_speed:ComponentSpeed
@export var component_engine:ComponentEngine
@export var component_transform:ComponentTransform
@export var component_turn:ComponentTurn
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
#	increase or decrease speed
	var drag = float(component_speed.current < 0) * -1 + float(component_speed.current >= 0) * 1
	var drag_amount = drag * 0.5 * component_speed.current  * component_speed.drag
	component_speed.current += component_speed.setting * component_engine.power - drag_amount
#	translate
	component_transform.xyz.move_local_x(component_speed.current * delta)
#	rotate
	if component_waypoints.waypoints.size() > 0:
		if component_waypoints.waypoints[0].distance_to(component_transform.xyz.position) < 50:
			component_waypoints.waypoints.pop_front()
		else:
			var direction = component_waypoints.waypoints[0] - component_transform.xyz.global_position
			var angleto = component_transform.xyz.transform.x.angle_to(direction)
			component_transform.xyz.rotate(sign(angleto) * min(delta * component_turn.speed, abs(angleto)))
	pass

extends Node2D

@export var component_waypoints:ComponentWaypoints
@export var component_speed:ComponentSpeed
@export var component_engine:ComponentEngine
@export var component_transform:ComponentTransform
@export var component_turn:ComponentTurn
var parent_transform
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
#	increase or decrease speed
	var drag = float(component_speed.current < 0) * -1
	component_speed.current += component_speed.setting * component_engine.power - drag * 0.5 * component_speed.current * component_speed.current * component_speed.drag
#	translate
	var forward:Vector2 = Vector2.UP * component_speed.current * delta
	component_transform.xyz.translate(forward)
#	rotate
	if component_waypoints.waypoints.size() > 0:
		if component_waypoints.waypoints[0].distance_to(component_transform.xyz.position) < 50:
			component_waypoints.waypoints.pop_front()
		else:
			var direction = component_waypoints.waypoints[0] - component_transform.xyz.global_position
			var angleto = component_transform.xyz.transform.x.angle_to(direction)
			component_transform.xyz.rotate(sign(angleto) * min(delta * component_turn.speed, abs(angleto)))
	pass


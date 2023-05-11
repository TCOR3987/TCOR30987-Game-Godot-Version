extends Node2D

class_name SystemWaypointsChange

@export var component_waypoints:ComponentWaypoints
@export var component_select:ComponentSelect

func _ready():
	SignalBus.connect("waypoint_change", _waypoint_change)

func _waypoint_change(a:Vector2):
	if component_select.selected == true:
		if component_waypoints.waypoints.size() > 0:
			component_waypoints.waypoints[0] = a
		else:
			component_waypoints.waypoints.append(a)

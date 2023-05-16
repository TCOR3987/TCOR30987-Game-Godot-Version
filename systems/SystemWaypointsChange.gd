extends Node2D

class_name SystemWaypointsChange

@export var component_waypoints:ComponentWaypoints
@export var component_select:ComponentSelect

func _ready():
	SignalBus.connect("waypoint_change", waypoint_change)
	SignalBus.connect("waypoint_add", waypoint_add)
	SignalBus.connect("waypoints_clear", waypoints_clear)

func waypoint_change(a:Vector2):
	if component_select.selected == true:
		if component_waypoints.waypoints.size() > 0:
			component_waypoints.waypoints.clear()
			component_waypoints.waypoints.append(a)
		else:
			component_waypoints.waypoints.append(a)

func waypoint_add(a:Vector2):
	if component_select.selected == true:
		component_waypoints.waypoints.append(a)

func waypoints_clear():
	if component_select.selected == true:
		component_waypoints.waypoints.clear()

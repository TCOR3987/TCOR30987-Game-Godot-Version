extends Node2D

class_name SystemWaypointsDraw

@export var component_waypoints:ComponentWaypoints
@export var component_transform:ComponentTransform
@export var component_select:ComponentSelect

func _process(delta):
	queue_redraw()

func _draw():
	if component_select.selected == true:
		if component_waypoints.waypoints.size() > 0:
			self.global_rotation = 0
			var lines:Array[Vector2] = []
			lines.append(Vector2(0,0))
			for waypoint in component_waypoints.waypoints:
				var point_position = waypoint - global_position
				lines.append(point_position)
			draw_polyline(lines,Color(200,200,0))

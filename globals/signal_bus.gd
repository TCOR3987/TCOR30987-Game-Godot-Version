extends Node

signal waypoint_change(Vector2)
signal waypoint_add(Vector2)
signal waypoints_clear
signal deselect_entities
signal spawn_missile(target)
signal speed_change(int)
signal fire_missile(target)
signal damage_target(target_id,int)

signal entity_waypoints(Array,Vector2)

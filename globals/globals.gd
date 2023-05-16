extends Node

var player_team = 1

var ship_combat_ability:ship_combat_enum_abilities
enum ship_combat_enum_abilities {
	none,
	select,
	waypoint_set,
	waypoint_add,
	missile
}

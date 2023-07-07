extends Node2D

class_name SystemMovementMissile

@export var component_target:ComponentTarget
@export var component_speed:ComponentSpeed
@export var component_transform:ComponentTransform
@export var component_turn:ComponentTurn

func _process(delta):
#	increase or decrease speed
	var drag = float(component_speed.current < 0) * -1 + float(component_speed.current >= 0) * 1
	var drag_amount = drag * 0.5 * component_speed.current  * component_speed.drag
	component_speed.current += component_speed.setting * component_speed.power - drag_amount
#	translate
	component_transform.xyz.move_local_x(component_speed.current * delta)
#	rotate
	if component_target.target != null:
		var target_entity = component_target.target
		var direction =  target_entity.global_position - component_transform.xyz.global_position
		var angleto = component_transform.xyz.transform.x.angle_to(direction)
		component_transform.xyz.rotate(sign(angleto) * min(delta * component_turn.speed, abs(angleto)))
	pass

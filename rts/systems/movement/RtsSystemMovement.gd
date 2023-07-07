extends Node2D

class_name RtsSystemMovement

@export var transform_:ComponentTransform
@export var speed:ComponentSpeed
@export var waypoints:ComponentWaypoints
@export var target:ComponentTarget
@export var weapon:ComponentWeapon
@export var turn:ComponentTurn

var distance_to_target:float
var velocity:Vector2

func _ready():
	pass

func _process(delta):
	speed.setting = 5
	var target_position:Vector2
	var range:float = 0
	if target.target != null:
		target_position = target.target.global_position
		range = weapon.range
		#	rotate ship
		var direction = target_position - transform_.xyz.global_position
		var angleto = transform_.xyz.transform.x.angle_to(direction)
		transform_.xyz.rotate(sign(angleto) * min(delta * turn.speed, abs(angleto)))
	#	move ship
		var drag = float(speed.current < 0) * -1 + float(speed.current >= 0) * 1
		var drag_amount = drag * 0.5 * speed.current  * speed.drag
	#	increase speed if distance to target is higher than weapon range else reduces speed by drag
		speed.current += float(global_position.distance_to(target_position) > range) * speed.setting * speed.power - drag_amount
		if global_position.distance_to(target_position) < 5:
			waypoints.waypoints.pop_front()
	elif waypoints.waypoints.size() > 0:
		target_position = waypoints.waypoints[0]
		#	rotate ship
		var direction = target_position - transform_.xyz.global_position
		var angleto = transform_.xyz.transform.x.angle_to(direction)
		transform_.xyz.rotate(sign(angleto) * min(delta * turn.speed, abs(angleto)))
	#	move ship
		var drag = float(speed.current < 0) * -1 + float(speed.current >= 0) * 1
		var drag_amount = drag * 0.5 * speed.current  * speed.drag
	#	increase speed if distance to target is higher than weapon range else reduces speed by drag
		speed.current += float(global_position.distance_to(target_position) > range) * speed.setting * speed.power - drag_amount
		if global_position.distance_to(target_position) < 5:
			waypoints.waypoints.pop_front()
	pass

func _physics_process(delta):
	if target.target != null || waypoints.waypoints.size() > 0:
		transform_.xyz.move_local_x(speed.current * delta)

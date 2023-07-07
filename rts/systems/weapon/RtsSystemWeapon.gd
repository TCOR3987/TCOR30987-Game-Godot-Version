extends Node2D

class_name RtsSystemWeapon

@export var target:ComponentTarget
@export var weapon:ComponentWeapon
@export var team:ComponentTeam

var parent 
var targets = []

func _ready():
	parent = get_parent()
	$WeaponDetectionRange/CollisionShape2D.shape.radius = weapon.range


func _process(delta):
	pass


func _on_weapon_detection_range_body_entered(body):
	var check = targets.find(body)
	if check < 0:
		targets.append(body)
	pass # Replace with function body.


func _on_weapon_detection_range_body_exited(body):
	var check = targets.find(body)
	if check >= 0:
		targets.remove_at(check)
	pass # Replace with function body.


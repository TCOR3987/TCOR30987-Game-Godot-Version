extends CharacterBody2D

class_name EntityMissile

func set_target(target):
	$ComponentTarget.target = target

func set_transform_(transform_msg):
	self.global_position = transform_msg

func _process(delta):
	var get_target = instance_from_id($ComponentTarget.target)
	if self.global_position.distance_to(get_target.global_position) < 5:
		get_parent().remove_child(self)
		pass
	pass

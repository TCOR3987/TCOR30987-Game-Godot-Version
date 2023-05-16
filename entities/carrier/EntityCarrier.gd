extends CharacterBody2D

class_name EntityCarrier

@export var team:int = 0

func _ready():
	$TeamComponent.team = team

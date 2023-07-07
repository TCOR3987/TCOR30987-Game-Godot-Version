extends Node2D

class_name ComponentWeapon

enum enum_type {
	Missile,
	Projectile,
}

enum enum_status {
	HoldFire,
	OpenFire,
}

@export var type:enum_type = enum_type.Projectile
@export var range:float = 1000
@export var damage:float = 100
@export var timer:Timer
@export var status:enum_status = enum_status.OpenFire


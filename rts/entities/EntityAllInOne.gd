extends CharacterBody2D

enum enum_entity_state {Wreck,Derelict,Active}
enum enum_entity_type {Carrier,Ship,Missile}
enum enum_missile_type {}

@export var hitpoints:float = 100
@export var team:int = 0

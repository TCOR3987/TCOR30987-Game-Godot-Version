extends Camera2D

var camera_size = 1
var camera_speed = 100
var velocity:Vector2
var zoom_factor:float = 1
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var x_direction = 0 + float(Input.is_action_pressed("a") == true) * -1 + float(Input.is_action_pressed("d") == true) * 1
	var y_direction = 0 + float(Input.is_action_pressed("w") == true) * -1 + float(Input.is_action_pressed("s") == true) * 1
	
	var velocity = Vector2(x_direction,y_direction) * camera_speed
	self.translate(velocity)
	
#	print(global_position)
	if Input.is_action_just_released("scroll_up"):
		self.zoom = self.zoom * 2
		zoom_factor = zoom_factor / 2
		if self.zoom.x > 1: self.zoom = Vector2(1,1)
		if zoom_factor < 1: zoom_factor = 1
		camera_speed = zoom_factor * 100
	
	if Input.is_action_just_released("scroll_down"):
		self.zoom = self.zoom / 2
		zoom_factor = zoom_factor * 2
		camera_speed = zoom_factor * 100
	pass

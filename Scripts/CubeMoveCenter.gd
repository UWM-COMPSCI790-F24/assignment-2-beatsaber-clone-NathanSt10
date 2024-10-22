extends CSGBox3D

# Used to initialize start position
var rng = RandomNumberGenerator.new()
var start_x = rng.randf_range(-0.1, 0.1)
var start_y = rng.randf_range(0.5, 1.5)
var start_z = rng.randf_range(-15, -15)
var color_red = preload("res://Materials/blue_cube.tres")
var color_blue = preload("res://Materials/red_cube.tres")

var start_position = Vector3(start_x, start_y, start_z) 
var move_direction = Vector3(0, 0, 1)  # Move along the Z-axis
var move_speed = 3

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	position = start_position
	print(start_x)
	if start_x > 0:
		material = color_red
		get_child(0).set_collision_layer_value(9, true)
	else:
		material = color_blue
		get_child(0).set_collision_layer_value(10, true)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position += move_direction * move_speed * delta
	
	if position.z > 5:
		queue_free()

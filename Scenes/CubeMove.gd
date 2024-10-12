extends CSGBox3D

# Used to initialize start position
var start_x = 0
var start_y = 1.5
var start_z = -20

var start_position = Vector3(start_x, start_y, start_z) 
var move_direction = Vector3(0, 0, 1)  # Move along the Z-axis
var move_speed = 2

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#position = start_position
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	#position += move_direction * move_speed * delta
	pass

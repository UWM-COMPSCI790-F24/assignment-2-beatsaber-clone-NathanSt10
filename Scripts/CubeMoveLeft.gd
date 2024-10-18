extends CSGBox3D

# Used to initialize start position
var rng = RandomNumberGenerator.new()
var start_x = rng.randf_range(-1.25, -0.5)
var start_y = rng.randf_range(0.5, 1.5)
var start_z = rng.randf_range(-14.5, -15.5)

var start_position = Vector3(start_x, start_y, start_z) 
var move_direction = Vector3(0, 0, 1)  # Move along the Z-axis
var move_speed = 3

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	position = start_position



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position += move_direction * move_speed * delta
	
	if position.z > 5:
		queue_free()

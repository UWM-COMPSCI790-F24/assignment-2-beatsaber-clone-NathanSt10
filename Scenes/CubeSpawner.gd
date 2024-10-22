extends WorldEnvironment

var cube = preload("res://SceneInstance/rhythm_cube.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var timer = Timer.new()
	timer.wait_time = 1.5
	timer.autostart = true
	timer.one_shot = false
	add_child(timer)
	
	timer.timeout.connect(_on_Timer_timeout)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_Timer_timeout() -> void:
	var cube_instance_left = cube.instantiate()
	var cube_instance_right = cube.instantiate()
	var cube_instance_center = cube.instantiate()
	
	cube_instance_left.set_script(load("res://Scripts/CubeMoveLeft.gd"))
	cube_instance_right.set_script(load("res://Scripts/CubeMoveRight.gd"))
	cube_instance_center.set_script(load("res://Scripts/CubeMoveCenter.gd"))
	
	add_child(cube_instance_left)
	add_child(cube_instance_right)
	add_child(cube_instance_center)
	#spawn_three_cubes()
	
func spawn_three_cubes():
	var rng = RandomNumberGenerator.new()
	var start_x = rng.randf_range(-1, -0.25)
	
	var top = cube.instantiate()
	var middle = cube.instantiate()
	var bottom = cube.instantiate()
	
	top.set_script(load("res://Scripts/CubeMoveLeft.gd"))
	middle.set_script(load("res://Scripts/CubeMoveLeft.gd"))
	bottom.set_script(load("res://Scripts/CubeMoveLeft.gd"))
	
	top.start_position = Vector3(start_x, 1.3, -15)
	middle.start_position = Vector3(start_x, 1, -15)
	bottom.start_position = Vector3(start_x, .7, -15)
	
	add_child(top)
	add_child(middle)
	add_child(bottom)

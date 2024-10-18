extends WorldEnvironment

var cube = preload("res://SceneInstance/rhythm_cube.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var timer = Timer.new()
	timer.wait_time = 1
	timer.autostart = true
	timer.one_shot = false
	add_child(timer)
	
	timer.timeout.connect(_on_Timer_timeout)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_Timer_timeout() -> void:
	var cube_instance_left = cube.instantiate()
	var cube_instance_center = cube.instantiate()
	var cube_instance_right = cube.instantiate()
	cube_instance_left.set_script(load("res://Scripts/CubeMoveLeft.gd"))
	cube_instance_center.set_script(load("res://Scripts/CubeMoveCenter.gd"))
	cube_instance_right.set_script(load("res://Scripts/CubeMoveRight.gd"))
	cube_instance_left.get_child(0).set_collision_layer_value(9, true)
	cube_instance_center.get_child(0).set_collision_layer_value(1, true)
	cube_instance_right.get_child(0).set_collision_layer_value(10, true)
	add_child(cube_instance_left)
	add_child(cube_instance_center)
	add_child(cube_instance_right)

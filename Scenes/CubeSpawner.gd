extends WorldEnvironment

var cube = preload("res://SceneInstance/rhythm_cube.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var timer = Timer.new()
	timer.wait_time = 2
	timer.autostart = true
	timer.one_shot = false
	add_child(timer)
	
	timer.timeout.connect(_on_Timer_timeout)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_Timer_timeout() -> void:
	var cube_instance1 = cube.instantiate()
	var cube_instance2 = cube.instantiate()
	var cube_instance3 = cube.instantiate()
	add_child(cube_instance1)
	add_child(cube_instance2)
	add_child(cube_instance3)

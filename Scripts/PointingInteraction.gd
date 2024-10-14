extends XRController3D

var isExtended = true

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	
	var start = global_position + (-global_basis.z * 0.1)
	var end = (-global_basis.z * 1) + start
	
	$"LineRenderer".points[0] = start
	$"LineRenderer".points[1] =  end
	
	$"RayCast3D".target_position = end
	
	if $"RayCast3D".is_colliding():
		var collider = $"RayCast3D".get_collider()
		if collider!= null:
			print("Collision detected: ", collider.name)
			if collider.name == "RCArea":
				print("Destroying Box: ", collider.name)
				destroy_cube(collider.get_parent())


func _on_button_pressed(name: String) -> void:
	if name == "ax_button":
		if isExtended:
			$"LineRenderer".visible = false
			$"RayCast3D".enabled = false
			isExtended = false
		else: 
			$"LineRenderer".visible = true
			$"RayCast3D".enabled = true
			isExtended = true
	
func destroy_cube(cube):
	cube.queue_free()
	print("Cube Destroyed: ", cube.name)

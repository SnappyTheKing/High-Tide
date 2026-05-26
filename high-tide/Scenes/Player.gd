extends CharacterBody2D


func _physics_process(delta: float) -> void:
	var target := get_angle_to(get_global_mouse_position())
	rotation += rotate_toward(0, target, 0.025)
	
	velocity *= 0.99
	
	if velocity.length() < 1:
		velocity = Vector2.ZERO
	
	velocity = velocity.rotated(rotate_toward(0, target, 0.025))
	
	if Input.is_action_pressed("accelerate"):
		velocity += Vector2.from_angle(rotation) * 50
	
	
	move_and_slide()

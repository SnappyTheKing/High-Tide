extends CharacterBody2D


func _physics_process(delta: float) -> void:
	var target = get_angle_to(get_global_mouse_position())
	rotate(target)
	
	velocity *= 0.95
	
	if velocity.length() < 1:
		velocity = Vector2.ZERO
	
	if Input.is_action_pressed("accelerate"):
		velocity += Vector2.from_angle(rotation) * 500
	
	
	move_and_slide()

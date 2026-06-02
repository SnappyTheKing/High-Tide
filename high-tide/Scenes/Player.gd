extends CharacterBody2D

@export var starting_boat: Player

@onready var boat_1: Sprite2D = %StarterBoat
@onready var boat_2: Sprite2D = %BetterBoat
@onready var boat_3: Sprite2D = %BestBoat

func _ready() -> void:
	Globals.player_stats = starting_boat

func _physics_process(delta: float) -> void:
	var target := get_angle_to(get_global_mouse_position())
	rotation += rotate_toward(0, target, Globals.player_stats.handling)
	
	velocity *= Globals.player_stats.drag
	
	if velocity.length() < 1:
		velocity = Vector2.ZERO
	
	velocity = velocity.rotated(rotate_toward(0, target, Globals.player_stats.handling))
	
	if Input.is_action_pressed("accelerate"):
		velocity += Vector2.from_angle(rotation) * Globals.player_stats.speed
	
	
	move_and_slide()

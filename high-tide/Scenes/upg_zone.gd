extends Node2D

@onready var text: Label = %Text

@export var player: CharacterBody2D
@export var yacht: Player
@export var cargo: Player

var current_boat: int = 0

func _process(delta: float) -> void:
	if current_boat < 2:
		text.text = "Cost to upgrade boat: $" + str(boat_lookup(current_boat))
	else:
		text.text = "Max Upgrade"

func _on_area_2d_body_entered(body: Node2D) -> void:
	print("entered upg zone!")
	if Globals.money >= boat_lookup(current_boat):
		Globals.money -= boat_lookup(current_boat)
		current_boat += 1
		if current_boat == 1:
			player.get_child(1).hide()
			player.get_child(3).show()
			Globals.player_stats = yacht
		if current_boat == 2:
			player.get_child(3).hide()
			player.get_child(4).show()
			Globals.player_stats = cargo


func boat_lookup(num: int) -> int:
	if num == 0:
		return yacht.cost
	if num == 1:
		return cargo.cost
	else:
		return 0

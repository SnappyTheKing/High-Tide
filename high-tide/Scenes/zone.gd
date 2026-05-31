extends Node2D

@export var port: Port

func _on_area_2d_body_entered(body: Node2D) -> void:
	print("entered!")
	Globals.zone_entered.emit(port)

func _on_area_2d_body_exited(body: Node2D) -> void:
	print("exited!")
	Globals.zone_exited.emit()

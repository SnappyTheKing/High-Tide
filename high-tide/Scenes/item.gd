extends PanelContainer

@onready var image: TextureRect = %Image
@onready var item_name: Label = %Name
@onready var button: Button = %Button

var origin: Vector2
var value

var item_type: Item:
	set(val):
		image.texture = val.sprite
		origin = Globals.current_port_position
		value = val.value
		item_name.text = val.name + " - $" + str(val.value)

func _on_button_pressed() -> void:
	Globals.money += calculate_value(value, origin, Globals.current_port_position)
	queue_free()

func _on_button_mouse_entered() -> void:
	button.tooltip_text = "Sell for $" + str(calculate_value(value, origin, Globals.current_port_position))

func calculate_value(base: int, item_pos: Vector2, port_pos: Vector2) -> int:
	var mult = sqrt(item_pos.distance_to(port_pos) + 1) / 200
	return (base * mult) + (base * 0.5)

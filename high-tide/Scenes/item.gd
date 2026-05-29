extends PanelContainer

@onready var image: TextureRect = %Image
var value: int

var item_type: Item:
	set(val):
		image.texture = val.sprite
		value = val.value

func _on_button_pressed() -> void:
	Globals.money += value
	queue_free()

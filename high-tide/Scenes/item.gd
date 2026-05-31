extends PanelContainer

@onready var image: TextureRect = %Image
@onready var item_name: Label = %Name
var value: int

var item_type: Item:
	set(val):
		image.texture = val.sprite
		value = val.value
		item_name.text = val.name + " - $" + str(value)

func _on_button_pressed() -> void:
	Globals.money += value
	queue_free()

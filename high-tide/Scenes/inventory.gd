extends Control

@export var inventory_item: PackedScene

@onready var item_container: GridContainer = %ItemContainer
@onready var shop_image: TextureRect = %ItemImage
@onready var buy_button: Button = %BuyButton
@onready var port_name: Label = %PortName

var shop_item: Item

func _ready() -> void:
	hide()
	
	Globals.zone_entered.connect(_on_zone_entered)
	Globals.zone_exited.connect(_on_zone_exited)
	
	#var instance = inventory_item.instantiate()
	#item_container.add_child(instance)
	#instance.item_type = load("res://Resources/Items/wood.tres")



func _on_zone_entered(port: Port):
	shop_item = port.sold_item
	shop_image.texture = port.sold_item.sprite
	buy_button.text = "Buy " + shop_item.name + " - $" + str(shop_item.value)
	port_name.text = port.name
	show()

func _on_zone_exited():
	hide()


func _on_buy_button_pressed() -> void:
	if item_container.get_child_count() >= Globals.player_stats.inventory_size or Globals.money < shop_item.value:
		return
	
	Globals.money -= shop_item.value
	
	var instance = inventory_item.instantiate()
	item_container.add_child(instance)
	instance.item_type = shop_item

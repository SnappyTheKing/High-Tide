extends Control

@export var inventory_item: PackedScene

@onready var item_container: GridContainer = $PanelContainer/ItemContainer
@onready var money: Label = $Money

func _ready() -> void:
	var instance = inventory_item.instantiate()
	item_container.add_child(instance)
	instance.item_type = load("res://Resources/wood.tres")
	

func  _process(delta: float) -> void:
	money.text = "Money: " + str(Globals.money)

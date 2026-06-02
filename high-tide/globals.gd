extends Node

signal zone_entered(port: Port)
signal zone_exited()

var player_stats: Player

var current_port_position: Vector2 = Vector2.ZERO
var money := 10000.0

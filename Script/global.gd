extends Node

var coins = 0 setget set_coins
func set_coins(value):
	coins = value
	hud.set_coins(value)


var player_health = 100


# Declare member variables here. Examples:
# var a = 2
onready var _current_level
onready var hud = $HUD


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.




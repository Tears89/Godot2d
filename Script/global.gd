extends Node

var SETTINGS := Settings.new()

var paused = false setget set_paused
func set_paused(value):
	paused = value
	hud.get_node("PauseMenu").visible = paused
	get_tree().set_pause(paused)
	pass

var is_game_started = false
signal game_start


var coins = 0 setget set_coins
func set_coins(value):
	coins = value
	hud.set_coins(value)

var Health = 100
#var player_health = 100


# Declare member variables here. Examples:
# var a = 2
onready var _current_level
onready var hud = $HUD


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _input(event):
	if event.is_action("pause") and Input.is_action_just_pressed("pause"):
		if is_game_started:
			set_paused(!paused)
		pass

func start_game():
	is_game_started = true
	hud.show()
	pass

func exit_from_game_in_main_menu():
	is_game_started = false
	hud.hide()
	pass


func reset_health():
	Health = 100
	hud.set_health_bar(Health)

func reset_coins():
	coins = 0
	hud.set_coins(coins)


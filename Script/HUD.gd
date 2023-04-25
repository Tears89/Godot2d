extends CanvasLayer

var coins = 0
onready var pause_menu = $"%PauseMenu"

func _ready():
	$Coins.text = String(coins) 

func set_health_bar(value):
	$HealthBar.value = value
	pass

func set_coins(value):
#	coins = coins + 1
	$Coins.text = str(value)
#	_ready()

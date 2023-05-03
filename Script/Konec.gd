extends Control


func _ready():
	Global.exit_from_game_in_main_menu()

func _on_Exit_pressed():
	get_tree().quit()
	

extends Control





func _on_Start_pressed():
	get_tree().change_scene("res://Worlds/World_01.tscn")
	Global.start_game()


func _on_Exit_pressed():
	get_tree().quit()


func _on_Settings_pressed():
	get_node("Option_Control").show()



extends Area2D

signal coin_collected



func _on_Coin_body_entered(body):
	
	if body.name == "Player":
		Global.coins += 1
		queue_free()
#		emit_signal("coin_collected")
	pass # Replace with function body.

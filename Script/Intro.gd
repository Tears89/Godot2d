extends Node2D

func _ready():
	$AnimationPlayer.play("Fade in")
	yield(get_tree().create_timer(6), "timeout")
	$AnimationPlayer.play("Fade out")
	yield(get_tree().create_timer(3), "timeout")
	get_tree().change_scene("res://Preabs/Load.tscn")

func _input(event):
	if event is InputEventKey or event is InputEventMouseButton:
		get_tree().change_scene("res://Preabs/Load.tscn")

extends KinematicBody2D


const Speed = 250
const Gravity = 15
const JumpVelocity = 480
const UP = Vector2(0, -1)


var Movement = Vector2()

var Coin = 0

var Health = 100

func _ready():
	Health = Global.Health

func _physics_process(delta):
	Movement = move_and_slide(Movement, UP)
	Movement.y +=Gravity
	Keyboard()
	if position.y > get_viewport_rect().size.y:
		Global.reset_coins()
		get_tree().reload_current_scene()

func _input(event):
	if Input.is_action_pressed("Move_Left"):
		Movement.x = -Speed
		$Sprite.play("run")
		$Sprite.flip_h = true
	elif Input.is_action_pressed("Move_Right"):
		Movement.x = Speed
		$Sprite.play("run")
		$Sprite.flip_h = false
	else:
		Movement.x = 0
		$Sprite.play("idle")
	
	if is_on_floor():
		if Input.is_action_just_pressed("Jump"):
			Movement.y = -JumpVelocity
	else:
		$Sprite.play("jump")


func ApplyDmg(dmg :int):
	if not $DamageTimer.is_stopped():
		return
	
	Health -= dmg
	Global.Health -= dmg
	prints("Health:", Health)
	Global.hud.set_health_bar(Health)
	$DamageTimer.start()
	
	if Health <= 0:
		Health = 0
#		Global.Health = 0
		Global.reset_health()
		get_tree().reload_current_scene()
	
	if Coin <= 0:
		Coin = 0
		Global.reset_coins()
		

func Keyboard():
	
	
	
	pass





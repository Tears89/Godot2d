extends KinematicBody2D


var velocity = Vector2()
var direction = 1;
const Gravity = 15
const Speed = 200;
const Floor = Vector2(0, -1)
const DAMAGE_AMOUNT = 10

func _ready():
	$Sprite.play("run")

func _process(delta):
	velocity.x = direction * Speed
	if not $RayCast2D.is_colliding():
		direction *= -1;
		$RayCast2D.position.x *= -1
		$Sprite.flip_h = bool(1-direction)
	velocity.y += Gravity
	
	velocity = move_and_slide(velocity,Floor)








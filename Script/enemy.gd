extends KinematicBody2D


var velocity = Vector2()
var direction = 1;
const Gravity = 15
const Speed = 200;
const Floor = Vector2(0, -1)
export var DAMAGE_AMOUNT = 50

func _ready():
	$Sprite.play("run")
	$Area2D.connect("body_entered", self, "_on_body_entered")
	

func _process(delta):
	velocity.x = direction * Speed
	if not $RayCast2D.is_colliding():
		direction *= -1;
		$RayCast2D.position.x *= -1
		$Sprite.flip_h = bool(1-direction)
	velocity.y += Gravity
	
	velocity = move_and_slide(velocity,Floor)
	
	var _collision_count = get_slide_count()
	if get_slide_count() > 0:
		for collision_idx in range(_collision_count):
			var _body = get_slide_collision(collision_idx).collider
			if _body.is_in_group("Player"):
				_body.ApplyDmg(DAMAGE_AMOUNT)
			pass
	
#	for body in $Area2D.get_overlapping_bodies():
#		if body.is_in_group("Player"):
#			body.ApplyDmg(DAMAGE_AMOUNT*delta)
#		pass

func _on_body_entered(body):
	if body.is_in_group("Player"):
		body.ApplyDmg(DAMAGE_AMOUNT)
		pass
	pass







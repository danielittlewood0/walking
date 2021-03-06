extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var speed = 400

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _process(delta):
	var velocity = Vector2()
	if Input.is_action_pressed("ui_right"):
		velocity.x += 1
		$AnimatedSprite.set_animation("rightwalk")
	if Input.is_action_pressed("ui_left"):
		velocity.x -= 1
		$AnimatedSprite.set_animation("leftwalk")
	if Input.is_action_pressed("ui_down"):
		velocity.y += 1
	if Input.is_action_pressed("ui_up"):
		velocity.y -= 1
	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
		$AnimatedSprite.play()
	else:
		# complete this animation cycle and return to standing
		if $AnimatedSprite.get_frame() == 0:
			$AnimatedSprite.stop()
		else:
			$AnimatedSprite.play()

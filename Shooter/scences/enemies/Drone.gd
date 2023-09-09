extends CharacterBody2D


func _physics_process(_delta):
	var direction = Vector2.LEFT * 50
	velocity = direction
	move_and_slide()

func hit():
	print("damage")

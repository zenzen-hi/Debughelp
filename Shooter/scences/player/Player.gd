extends CharacterBody2D

signal laser(pos, player_direction)
signal grenade(pos, player_direction)

const SPEED = 600.0

var can_laser: bool = true
var can_grenade: bool = true

func _physics_process(_delta):
	
	var direction = Input.get_vector("left","right","up","down")
	velocity = direction * SPEED
	move_and_slide()
	
	#rotate
	look_at(get_global_mouse_position())
	var player_direction = (get_global_mouse_position() - position).normalized()


	if Input.is_action_just_pressed("primary action") and can_laser and Globals.laser_amount > 0:
		Globals.laser_amount -= 1
		$GPUParticles2D.emitting = true
		can_laser = false
		$LaserCooldown.start()
		laser.emit($LaserStartPositions.get_children().pick_random().global_position, player_direction)
	
	if Input.is_action_just_pressed("secondary action") and can_grenade and Globals.grenade_amount > 0:
		Globals.grenade_amount -= 1
		can_grenade = false
		$GrenadeCooldown.start()
		grenade.emit($LaserStartPositions.get_children()[0].global_position, player_direction)

func _on_laser_cooldown_timeout():
	can_laser = true

func _on_grenade_timer_timeout():
	can_grenade = true

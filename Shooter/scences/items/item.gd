extends Area2D

var rotation_speed: int = 3
var available_options = ["laser","laser","laser","laser", "grenade", "health"]
var type = available_options[randi()%len(available_options)]
#var type = "health"

func _ready():
	if type == "laser":
		$Sprite2D.modulate = Color(0.1,0.5,0.5)
	if type == "grenade":
		$Sprite2D.modulate = Color(0.6,0.1,0.1)
	if type == "health":
		$Sprite2D.modulate = Color(0.1,0.6,0.1)

func _physics_process(delta):
	rotation += rotation_speed * delta

func _on_body_entered(_body):
	if type == 'grenade':
		Globals.grenade_amount += 3
	if type == 'laser':
		Globals.laser_amount += 6
	if type == 'health':
		Globals.health += 10
	queue_free()

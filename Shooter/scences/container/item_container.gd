extends StaticBody2D
class_name ItemContainer

signal open(pos, direction)

@onready var current_direction: Vector2 = Vector2.DOWN.rotated(rotation)

func hit():
	$Lidsprite.hide()
	open.emit($Spawnpositions.get_children().pick_random().global_position, current_direction)
	

extends Node2D
class_name LevelParent

#A PackedScene is the in-memory object that is loaded when you load a scene file
#Forcing :PackedScene only makes it easier to unsure a .tscn is loaded instead of a .png etc.
var laser_scene: PackedScene = preload("res://scences/projectiles/laser.tscn")
var grenade_scene: PackedScene = preload("res://scences/projectiles/grenade.tscn")
var item_scene: PackedScene = preload("res://scences/items/item.tscn")

func _ready():
	for container in get_tree().get_nodes_in_group("Container"):
		container.connect("open", _on_container_opened)
		
func _on_container_opened(pos, _direction):
	var item = item_scene.instantiate()
	item.position = pos
	$Items.call_deferred("add_child", item)
	

func _on_player_laser(pos, player_direction):
	var laser = laser_scene.instantiate() as Area2D
	laser.position = pos
	laser.rotation_degrees += rad_to_deg(player_direction.angle())
	laser.direction = player_direction
	$Pojectiles.add_child(laser)
	$UI.update_laser_text()

func _on_player_grenade(pos, player_direction):
	var grenade = grenade_scene.instantiate() as RigidBody2D
	grenade.position = pos
	grenade.linear_velocity = player_direction * grenade.speed
	$Pojectiles.add_child(grenade)
	print("3..2..1..BOOOOM!!!")
	$UI.update_grenade_text()


func _on_player_update_stats():
	$UI.update_laser_text()
	$UI.update_grenade_text()

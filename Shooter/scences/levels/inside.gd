extends LevelParent

#Never EVER do that in a scene, leads to circular loading
#var outside: PackedScene = preload("res://scences/levels/outside.tscn")

func _on_exit_gate_area_body_entered(_body):
#	get_tree().change_scene_to_file("res://scences/levels/outside.tscn")
#	get_tree().change_scene_to_packed(outside)
	TransitionLayer.change_scene("res://scences/levels/outside.tscn")

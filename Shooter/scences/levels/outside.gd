extends LevelParent

func _on_house_player_entered():
	var tween = get_tree().create_tween()
	tween.tween_property($Player/Camera2D, "zoom", Vector2(0.6,0.6), 1)

func _on_house_player_exited():
	var tween = get_tree().create_tween()
	tween.tween_property($Player/Camera2D, "zoom", Vector2(0.4,0.4), 2)
	
func _on_gate_player_entered_gate(_body):
#	get_tree().change_scene_to_file("res://scences/levels/inside.tscn")
	TransitionLayer.change_scene("res://scences/levels/inside.tscn")


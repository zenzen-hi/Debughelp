extends Area2D

signal player_entered
signal player_exited

func _on_body_entered(_body):
	emit_signal("player_entered")


func _on_body_exited(_body):
	emit_signal("player_exited")

extends StaticBody2D

func hit():
	$PointLight2D.energy = 0
	$restart.start()


func _on_restart_timeout():
	$PointLight2D.energy = 3.45

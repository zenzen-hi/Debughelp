extends Node

signal stat_change

var laser_amount:int = 20:
	set(value):
		laser_amount = value
		emit_signal("stat_change")

var grenade_amount:int = 8:
	set(value):
		grenade_amount = value
		emit_signal("stat_change")

var health = 60:
	set(value):
		health = value
		emit_signal("stat_change")

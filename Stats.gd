extends Node

export var max_healt = 1
onready var health = max_healt setget set_health

signal no_health

func set_health(value):
	health = value
	
	if health <= 0:
		emit_signal("no_health")

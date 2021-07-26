extends Node

export var max_healt = 1 setget set_max_health
var health = max_healt setget set_health

signal no_health
signal healt_changed(value)
signal max_healt_changed(value)

func _ready():
	self.health = max_healt

func set_max_health(value):
	max_healt = value
	self.health = min(health, max_healt)
	emit_signal("max_healt_changed", max_healt)
	
func set_health(value):
	health = value
	emit_signal("healt_changed", health)
	if health <= 0:
		emit_signal("no_health")

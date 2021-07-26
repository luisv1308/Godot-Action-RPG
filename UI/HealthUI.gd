extends Control

var hearts = 2 setget set_hearts
var max_hearts = 2 setget set_max_hearts
var bar_size = 0

onready var heartUIFULL = $HeartUIFull
onready var heartUIEMPTY = $HeartUIEmpty

func set_hearts(value):
	hearts = clamp(value, 0, max_hearts)
	if heartUIFULL != null:
		bar_size = 44 / max_hearts
		heartUIFULL.rect_size.x = hearts * bar_size

func set_max_hearts(value):
	max_hearts = max(value, 1)
	self.hearts = min(hearts, max_hearts)
	if heartUIFULL != null:
		bar_size = 44 / hearts
		heartUIFULL.rect_size.x = max_hearts * bar_size
	
func _ready():
	self.max_hearts = PlayerStats.max_healt
	self.hearts = PlayerStats.health
	PlayerStats.connect("healt_changed", self, "set_hearts")
	PlayerStats.connect("max_healt_changed", self, "set_max_hearts")

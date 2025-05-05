extends TextureRect

var screen_size

# Called when the node enters the scene tree for the first time.
func _ready():
	screen_size = get_viewport_rect().size

	#Selects and loads world select texture
	var image = load("res://textures/level-select/" + str(global.easy_level_progress) + "." + str(global.medium_level_progress) + "." +
					str(global.hard1)+ str(global.hard2) + str(global.hard3) + str(global.hard4) + str(global.hard5) + "." +"png")
	self.texture = image

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

extends TextureRect

var screen_size

# Called when the node enters the scene tree for the first time.
func _ready():
	screen_size = get_viewport_rect().size
	
	#Selects and loads world select texture
	var image = load("res://textures/level-select/" + str(5) + "." + str(5) + "." +
					str(global.hard1)+ str(1) + str(1) + str(1) + str(2) + "." +"png")
	self.texture = image

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

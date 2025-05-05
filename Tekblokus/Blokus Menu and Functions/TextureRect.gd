extends TextureRect

var screen_size
var image

# Called when the node enters the scene tree for the first time.
func _ready():
	screen_size = get_viewport_rect().size

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if not global.door_open:
		image = load("res://textures/textures/door_closed.png")
	
	if global.door_open:
		image = load("res://textures/textures/door_open.png")
		
	self.texture = image

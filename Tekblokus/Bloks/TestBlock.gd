extends ColorRect


# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if global.is_dragging:
		modulate = Color(Color.AQUA, 1)
	else:
		modulate = (Color(Color.WHITE, 1))
	
	if global.color:
		modulate = Color(Color.BLACK, 1)
	else:
		modulate = (Color(Color.WHITE, 1))

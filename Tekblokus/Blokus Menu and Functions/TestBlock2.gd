extends ColorRect

func _process(delta):
	if global.is_dragging:
		modulate = Color(Color.AQUA, 1)
	else:
		modulate = (Color(Color.WHITE, 1))
	
	if global.color2:
		modulate = Color(Color.BLACK, 1)
	else:
		modulate = (Color(Color.WHITE, 1))


extends Marker2D

func _draw():
	draw_circle(Vector2.ZERO, 35, Color.BLANCHED_ALMOND)

func select():
	for child in get_tree().get_nodes_in_group("zone"):
		child.deselect()
	modulate = Color.WEB_MAROON

func deselect():
	modulate = Color.WHITE

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

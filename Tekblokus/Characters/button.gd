extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_box_area_entered(area):
	print('hit')
	global.door_open = true

func _on_box_area_exited(area):
	print('missed')
	global.door_open = false

extends Area2D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func move(delta):
	position += delta

func _on_character_area_entered(area):
	global.outside = true
	if global.withchar:
		move(global.movement)


func _on_world_area_area_entered(area):
	print('Entered Wall')
	if global.withchar:
		move(global.movement * -1)

func _on_character_area_exited(area):
	global.outside = false

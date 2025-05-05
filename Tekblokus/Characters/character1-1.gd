extends Area2D

var screen_size
var gap = 146 * 2
var moving = false


var oldposx = global.xoneone
var oldposy = global.yoneone

var outside = false

func _ready():
	screen_size = get_viewport_rect().size
	global.outside = false

func _process(delta):
	
	#position.x = clamp(position.x, 0, get_viewport_rect().size.x)
	#position.y = clamp(position.y, 0, get_viewport_rect().size.y)
	
	if global.outside:
		position.x = oldposx
		position.y = oldposy
	
	if Input.is_action_just_pressed("w"):
		wdirection()
		
	if Input.is_action_just_pressed("a"):
		adirection()
		
	if Input.is_action_just_pressed("s"):
		sdirection()
		
	if Input.is_action_just_pressed("d"):
		ddirection()

func move(delta):
	position += delta
	moving = true
	
func _input(event):
	if (
		event.is_action_released("move_right") or 
		event.is_action_released("move_left") or 
		event.is_action_released("move_up") or 
		event.is_action_released("move_down") or 
		event.is_action_released("w") or
		event.is_action_released("a") or
		event.is_action_released("s") or
		event.is_action_released("d")
		
	):
		print('...')
		#global.w_moves.resize(0) #Resizes array to 0, in order to reset the amount of objects in the array

func wdirection():

	if not global.outside:
		oldposx = position.x
		oldposy = position.y

	if not moving:
		for n in global.w_moves.size():
			if global.w_moves[n] == "move_up" and global.up_enabled:		
				move(Vector2(0, -gap))
				moving = false
				$AnimatedSprite2D.animation = "Back View"
				global.movement = Vector2(0, -gap)
			elif global.w_moves[n] == "move_down" and global.down_enabled:
				move(Vector2(0, gap))
				moving = false  
				$AnimatedSprite2D.animation = "Front View"
				global.movement = Vector2(0, gap)
			elif global.w_moves[n] == "move_left" and global.left_enabled:
				move(Vector2(-gap, 0))
				moving = false
				$AnimatedSprite2D.animation = "Right Turn"
				global.movement = Vector2(-gap, 0)
			elif global.w_moves[n] == "move_right" and global.right_enabled:
				move(Vector2(gap, 0))
				moving = false
				$AnimatedSprite2D.animation = "Left Turn"
				global.movement = Vector2(gap, 0)
	
func adirection():
	
	if not global.outside:
		oldposx = position.x
		oldposy = position.y
		
	if not moving:			
		for n in global.a_moves.size():
			if global.a_moves[n] == "move_up" and global.up_enabled:
				move(Vector2(0, -gap))
				moving = false
				$AnimatedSprite2D.animation = "Back View"
				global.movement = Vector2(0, -gap)
			elif global.a_moves[n] == "move_down" and global.down_enabled:
				move(Vector2(0, gap))
				moving = false
				$AnimatedSprite2D.animation = "Front View"
				global.movement = Vector2(0, gap)
			elif global.a_moves[n] == "move_left" and global.left_enabled:
				move(Vector2(-gap, 0))
				moving = false
				$AnimatedSprite2D.animation = "Right Turn"
				global.movement = Vector2(-gap, 0)
			elif global.a_moves[n] == "move_right" and global.right_enabled:
				move(Vector2(gap, 0))
				moving = false
				$AnimatedSprite2D.animation = "Left Turn"
				global.movement = Vector2(gap, 0)
		
func sdirection():	
	
	if not global.outside:
		oldposx = position.x
		oldposy = position.y
		
	if not moving:	
		for n in global.s_moves.size():
			if global.s_moves[n] == "move_up" and global.up_enabled:
				move(Vector2(0, -gap))
				moving = false
				$AnimatedSprite2D.animation = "Back View"
				global.movement = Vector2(0, -gap)
			elif global.s_moves[n] == "move_down" and global.down_enabled:
				move(Vector2(0, gap))
				moving = false
				$AnimatedSprite2D.animation = "Front View"
				global.movement = Vector2(0, gap)  
			elif global.s_moves[n] == "move_left" and global.left_enabled:
				move(Vector2(-gap, 0))
				moving = false
				$AnimatedSprite2D.animation = "Right Turn"
				global.movement = Vector2(-gap, 0)
			elif global.s_moves[n] == "move_right" and global.right_enabled:
				move(Vector2(gap, 0))
				moving = false
				$AnimatedSprite2D.animation = "Left Turn"
				global.movement = Vector2(gap , 0)
				
func ddirection():		
	
	if not global.outside:
		oldposx = position.x
		oldposy = position.y
		
	if not moving:	
		for n in global.d_moves.size():
			if global.d_moves[n] == "move_up" and global.up_enabled:
				move(Vector2(0, -gap))
				moving = false
				$AnimatedSprite2D.animation = "Back View"
				global.movement = Vector2(0, -gap)
			elif global.d_moves[n] == "move_down" and global.down_enabled:
				move(Vector2(0, gap))
				moving = false
				$AnimatedSprite2D.animation = "Front View"
				global.movement = Vector2(0, gap)  
			elif global.d_moves[n] == "move_left" and global.left_enabled:
				move(Vector2(-gap, 0))
				moving = false
				$AnimatedSprite2D.animation = "Right Turn"
				global.movement = Vector2(-gap, 0)
			elif global.d_moves[n] == "move_right" and global.right_enabled:
				move(Vector2(gap, 0))
				moving = false
				$AnimatedSprite2D.animation = "Left Turn"
				global.movement = Vector2(gap, 0)


func _on_world_area_area_entered(area):
	global.outside = true


func _on_world_area_area_exited(area):
	global.outside = false
	
func _on_door_area_entered(area):
	global.outside = true
	global.withchar = false
	if global.door_open:
		print('You Win!')
		get_tree().change_scene_to_file("res://world.tscn")
		global.w_moves = []
		global.a_moves = []
		global.s_moves = []
		global.d_moves = []
		if global.easy_level_progress < 2:
			global.easy_level_progress = 2
			
		if global.medium_level_progress < 1:
			global.medium_level_progress = 1


func _on_box_area_entered(area):
	print('entered box')
	global.withchar = true


func _on_box_area_exited(area):
	print('exited box')
	global.withchar = false

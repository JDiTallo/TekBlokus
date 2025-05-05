extends CharacterBody2D

signal enter

var screen_size
var gap = 100
var moving = false

func _ready():
	screen_size = get_viewport_rect().size

func _process(delta):
	
	position.x = clamp(position.x, 0, get_viewport_rect().size.x)
	position.y = clamp(position.y, 0, get_viewport_rect().size.y)
	

		
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
		print(global.w_moves)
		#global.w_moves.resize(0) #Resizes array to 0, in order to reset the amount of objects in the array

func wdirection():
	if not moving:
		for n in global.w_moves.size():
			if global.w_moves[n] == "move_up" and global.up_enabled:
				move(Vector2(0, -gap))
				moving = false
			elif global.w_moves[n] == "move_down" and global.down_enabled:
				move(Vector2(0, gap))
				moving = false  
			elif global.w_moves[n] == "move_left" and global.left_enabled:
				move(Vector2(-gap, 0))
				moving = false
			elif global.w_moves[n] == "move_right" and global.right_enabled:
				move(Vector2(gap, 0))
				moving = false
	
func adirection():			
		for n in global.a_moves.size():
			if global.a_moves[n] == "move_up" and global.up_enabled:
				move(Vector2(0, -gap))
				moving = false
			elif global.a_moves[n] == "move_down" and global.down_enabled:
				move(Vector2(0, gap))
				moving = false  
			elif global.a_moves[n] == "move_left" and global.left_enabled:
				move(Vector2(-gap, 0))
				moving = false
			elif global.a_moves[n] == "move_right" and global.right_enabled:
				move(Vector2(gap, 0))
				moving = false
		
func sdirection():			
		for n in global.s_moves.size():
			if global.s_moves[n] == "move_up" and global.up_enabled:
				move(Vector2(0, -gap))
				moving = false
			elif global.s_moves[n] == "move_down" and global.down_enabled:
				move(Vector2(0, gap))
				moving = false  
			elif global.s_moves[n] == "move_left" and global.left_enabled:
				move(Vector2(-gap, 0))
				moving = false
			elif global.s_moves[n] == "move_right" and global.right_enabled:
				move(Vector2(gap, 0))
				moving = false
				
func ddirection():			
		for n in global.d_moves.size():
			if global.d_moves[n] == "move_up" and global.up_enabled:
				move(Vector2(0, -gap))
				moving = false
			elif global.d_moves[n] == "move_down" and global.down_enabled:
				move(Vector2(0, gap))
				moving = false  
			elif global.d_moves[n] == "move_left" and global.left_enabled:
				move(Vector2(-gap, 0))
				moving = false
			elif global.d_moves[n] == "move_right" and global.right_enabled:
				move(Vector2(gap, 0))
				moving = false



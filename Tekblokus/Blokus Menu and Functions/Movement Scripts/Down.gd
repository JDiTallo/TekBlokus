extends Node2D

var draggable = false
var is_inside_dropable = false #Tells if object is in a droppable space
var body_ref
var offset: Vector2 #Offset is so the object maintains the position when clicked on
var initialPos : Vector2

var w = false
var a = false
var s = false
var d = false

var is_inside_dropbox = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if draggable:
		if Input.is_action_just_pressed("click"):
			initialPos = global_position
			offset = get_global_mouse_position() - global_position
			global.is_dragging = true
			
		if Input.is_action_pressed("click"):
			global_position = get_global_mouse_position() - offset
			
		elif Input.is_action_just_released("click"):
			global.is_dragging = false
			
			var tween = get_tree().create_tween()
			
			if is_inside_dropable:
				tween.tween_property(self,"position",body_ref.position,0.2).set_ease(Tween.EASE_OUT)
				
				if w:
					global.w_moves.append("move_down")
					#up_position = global.w_moves.size()
					
				if a:
					global.a_moves.append("move_down")
					
				if s:
					global.s_moves.append("move_down")
					
				if d:
					global.d_moves.append("move_down")

			if not is_inside_dropable:
				#global.w_moves.resize(0)
				global.w_moves.erase("move_down")
				global.a_moves.erase("move_down")
				global.s_moves.erase("move_down")
				global.d_moves.erase("move_down")
				print(global.w_moves)
				print(global.a_moves)

				
			if is_inside_dropbox:
				#global.w_moves.resize(0)
				global.w_moves.erase("move_down")
				global.a_moves.erase("move_down")
				global.s_moves.erase("move_down")
				global.d_moves.erase("move_down")
				print(global.w_moves)


func _on_area_2d_mouse_entered():
	#If not being dragged, make the object draggable, and increase size for effect
	if not global.is_dragging:
		draggable = true
		scale = Vector2(1.05, 1.05)


func _on_area_2d_mouse_exited():
	#If not being dragged, make the object not draggable, and make the size back to normal
	if not global.is_dragging:
		draggable = false
		scale = Vector2(1, 1)


func _on_area_2d_body_entered(body:StaticBody2D):
	if body.is_in_group('dropable'):
		is_inside_dropable = true
		body.modulate = Color(Color.REBECCA_PURPLE, 1)
		body_ref = body
		
		if body.is_in_group('w'):
			w = true
		
		if body.is_in_group('a'):
			a = true
			
		if body.is_in_group('s'):
			s = true
		
		if body.is_in_group('d'):
			d = true
		
		global.down_enabled = true
		global.color = true
		
	if body.is_in_group('dropbox'):
		is_inside_dropable = true
		body.modulate = Color(Color.REBECCA_PURPLE, 1)
		body_ref = body
		is_inside_dropbox = true


func _on_area_2d_body_exited(body):
	if body.is_in_group('dropable'):
		is_inside_dropable = false
		body.modulate = Color(Color.MEDIUM_PURPLE, 0.7)
		body_ref = body
		
		#global.down_enabled = false
		global.color = false
		
	if body.is_in_group('w'):
		w = false
		
	if body.is_in_group('a'):
		a = false
		
	if body.is_in_group('s'):
		s = false
		
	if body.is_in_group('d'):
		d = false
		
	if body.is_in_group('dropbox'):
		is_inside_dropable = false
		body.modulate = Color(Color.MEDIUM_PURPLE, 0.7)
		is_inside_dropbox = false
		body_ref = body

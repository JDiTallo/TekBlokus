extends Node

var is_dragging = false
var color = false

var up_enabled = false
var down_enabled = false
var left_enabled = false
var right_enabled = false

var w_moves = []
var a_moves = []
var s_moves = []
var d_moves = []

var movement = Vector2(0, 0)

var yoneone = 718
var xoneone = 450

var yonetwo = 1488
var xonetwo = 1484

var xonethree = -328
var yonethree = -1278

var outside = false

var door_open = false

var withchar = false


#Easy and Medium Level Completion
var easy_level_progress = 1
var medium_level_progress = 0
	
#Hard Level Completion
var hard1 = 0
var hard2 = 0
var hard3 = 0
var hard4 = 0
var hard5 = 0

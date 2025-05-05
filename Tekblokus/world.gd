extends Node2D



func _on_1_0_00000_pressed():
	get_tree().change_scene_to_file("res://Easy1-1/Easy1-1.tscn")

func _on_1_1_00002_pressed():
	if global.easy_level_progress >= 2:
		get_tree().change_scene_to_file("res://Easy1-2/Easy1-2.tscn")

func _on_1_1_10000_pressed():
	if global.medium_level_progress >= 1:
		get_tree().change_scene_to_file("res://Easy1-3/Easy1-3.tscn")

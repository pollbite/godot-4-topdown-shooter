extends Node2D

func _ready():
	pass

func _process(delta: float) -> void:
	if (Input.is_action_just_pressed("click_window")):
		print("heard")
		get_tree().change_scene_to_file("res://screens/start_screen.tscn")

extends Node2D

@onready var audio_play = $AudioStreamPlayer2D

func _ready(): 
	EnemyCounter.current_enemy_count = 5

func _process(delta: float) -> void:
	if (EnemyCounter.current_enemy_count == 0): 
		get_tree().change_scene_to_file("res://screens/level_2_start_screen.tscn")

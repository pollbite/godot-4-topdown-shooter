extends Node2D

func _ready(): 
	EnemyCounter.current_enemy_count = 7
	HealthManager.health = 15

func _process(delta: float) -> void:
	if (EnemyCounter.current_enemy_count == 0): 
		get_tree().change_scene_to_file("res://screens/level_3_start_screen.tscn")

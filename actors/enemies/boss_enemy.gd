extends Enemy
class_name BossEnemy

@export var basic_enemy_scene: Resource

func hit(damage_number: int):
	hp -= damage_number
	audio_hit.play()
	if (hp <= 0): 
		audio_hit.play()
		ScoreManager.add_score(100)
		EnemyCounter.subtract_count(1)
		await audio_hit.finished
		queue_free()
		var new_enemy = basic_enemy_scene.instantiate()
		new_enemy.global_position = global_position + Vector2(20, 20)
		get_parent().add_child(new_enemy)
		
		var new_enemy2 = basic_enemy_scene.instantiate()
		new_enemy2.global_position = global_position + Vector2(-20, -20)
		get_parent().add_child(new_enemy2)
		
		var new_enemy3 = basic_enemy_scene.instantiate()
		new_enemy3.global_position = global_position + Vector2(10, 10)
		get_parent().add_child(new_enemy3)

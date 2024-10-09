extends Enemy
class_name ShooterEnemy

@onready var audio_enemy_shoot = $AudioStreamPlayer2D

@onready var enemy_projectile_scene = preload("res://actors/projectile/enemy_projectile.tscn")

func _intialize():
	var timer = $ShootTimer
	timer.wait_time = 1.0
	timer.start()

func hit(damage_number: int):
	hp -= damage_number
	audio_hit.play()
	if (hp <= 0):
		audio_hit.play() 
		ScoreManager.add_score(100)
		EnemyCounter.subtract_count(1)
		await audio_hit.finished
		queue_free()
	

func _on_shoot_timer_timeout() -> void:
	var new_projectile = enemy_projectile_scene.instantiate()
	new_projectile.position = global_position
	new_projectile.fire(global_position.direction_to(get_tree().get_first_node_in_group("Player").global_position), 500.00)
	get_parent().add_child(new_projectile)
	audio_enemy_shoot.play()
	pass # Replace with function body.

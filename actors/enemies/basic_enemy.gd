extends CharacterStateMachine
class_name Enemy 

@onready var audio_hit = $AudioStreamPlayer2D

@export var hp: int = 3
@export var move_speed: float = 200.0
@export var chase_distance: float = 100.0



func hit(damage_number: int):
	hp -= damage_number
	audio_hit.play()
	if (hp <= 0): 
		audio_hit.play()
		ScoreManager.add_score(100)
		EnemyCounter.subtract_count(1)
		await audio_hit.finished
		queue_free()
		

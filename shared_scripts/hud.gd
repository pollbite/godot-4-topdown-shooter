extends CanvasLayer

func _ready() -> void: 
	ScoreManager.score_updated.connect(_update_score)
	HealthManager.health_updated.connect(_update_health)
	
func _update_health(new_health):
	$HealthLabel.text = "Health: " + str(new_health)
	
func _update_score(new_score):
	$Label.text = "Score: " + str(new_score)

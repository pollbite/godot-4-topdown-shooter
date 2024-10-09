extends Node

signal score_updated

var current_score : int = 0

func add_score(num: int): 
	current_score += num
	score_updated.emit(current_score)
	
func clear_score():
	current_score = 0
	score_updated.emit(current_score)

extends Node

signal enemy_count_updated

var current_enemy_count : int = 0

func subtract_count(num: int): 
	current_enemy_count -= num
	enemy_count_updated.emit(current_enemy_count)

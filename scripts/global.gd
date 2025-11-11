extends Node
var death = false
var max_health = 5
var health = max_health
var coins = 0
func reset_game():
	death = false
	health = max_health
	coins = 0
func check_health():
	if health == 0:
		death = true

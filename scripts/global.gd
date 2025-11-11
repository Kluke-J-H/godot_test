extends Node
var death = false
var max_health = 5
var health = max_health
var coins = 0
var default_slime_damage = 1
var void_damage = max_health
var hurt_state = false
func reset_game():
	death = false
	health = max_health
	coins = 0
	hurt_state = false
func check_health():
	if health <= 0:
		death = true

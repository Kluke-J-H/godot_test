extends Area2D 
# Called when the node enters the scene tree for the first time.
@onready var timer = $Timer
var player
@export var damage: int = 1
func _ready():
	player = get_tree().current_scene.get_node("Player")
func _on_body_entered(_body: Node2D) -> void:
	var player_anim = player.get_node("AnimatedSprite2D")
	if !Global.hurt_state and Global.health >= 0:
		Global.health -= damage
		print(Global.health)
		player_anim.play("hurt")
		Global.check_health()
		if Global.death == true:
			print("death")
			player_anim.play("death")
			Engine.time_scale = 0.5
			timer.start()
		else:
			Global.hurt_state = true
			player_anim.play("hurt")
			await player_anim.animation_finished
			Global.hurt_state = false

func _on_timer_timeout() -> void:
	Engine.time_scale = 1.0
	Global.reset_game()
	get_tree().reload_current_scene()

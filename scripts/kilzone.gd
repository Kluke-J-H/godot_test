extends Area2D 
# Called when the node enters the scene tree for the first time.
@onready var timer = $Timer
var player

func _ready():
	player = get_tree().current_scene.get_node("Player")

func _on_body_entered(_body: Node2D) -> void:
	var player_anim = player.get_node("AnimatedSprite2D")
	Global.health -= 1
	print(Global.health)
	Global.check_health()
	if Global.death == true:
		print("death")
		player_anim.play("death")
		Engine.time_scale = 0.5
		#body.get_node("CollisionShape2D").queue_free()
		timer.start()


func _on_timer_timeout() -> void:
	Engine.time_scale = 1.0
	Global.reset_game()
	get_tree().reload_current_scene()

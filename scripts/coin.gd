extends Area2D




func _on_body_entered(body: Node2D) -> void:
	print("claimed")
	Global.coins += 1 # Replace with function body.
	print(Global.coins)
	queue_free()

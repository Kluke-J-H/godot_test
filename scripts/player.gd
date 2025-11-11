extends CharacterBody2D


const SPEED = 130.0
const JUMP_VELOCITY = -300.0

@onready var player: CharacterBody2D = $"."
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor() and Global.death == false:
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction and !Global.death:
		velocity.x = direction * SPEED
		if direction == -1:
			if !Global.hurt_state:
				animated_sprite_2d.play("run")
			animated_sprite_2d.flip_h = true
		else:
			if !Global.hurt_state:
				animated_sprite_2d.play("run")
			animated_sprite_2d.flip_h = false
	elif !Global.death and !Global.hurt_state:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		animated_sprite_2d.play("idle")
	else:
		velocity.x = 0
	
	move_and_slide()
	

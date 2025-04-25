extends CharacterBody2D

const SPEED = 300.0
const JUMP_VELOCITY = -400.0 # negative values are up

@onready var animated_sprite_2d = $AnimatedSprite2D
@onready var collision_shape_2d = $CollisionShape2D

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _physics_process(delta):
	
	#Grounded animation switch
	if is_on_floor():
		if not velocity == Vector2(0, 0):
			animated_sprite_2d.play("walk")
		else:
			animated_sprite_2d.play("idle")
	
	#Jumpin animation switch
	if not is_on_floor():
		animated_sprite_2d.play("Jump")
		velocity.y += gravity * delta
	
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
	
	#Lateral movement and direction select
	var direction = Input.get_axis("left", "right")
	if direction:
		if direction == -1.0:
			animated_sprite_2d.flip_h = true
		if direction == 1.0:
			animated_sprite_2d.flip_h = false
		velocity.x = direction * SPEED
			
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		
	move_and_slide()

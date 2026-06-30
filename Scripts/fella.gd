extends CharacterBody2D


const WALK_SPEED = 100
const RUN_SPEED = 150
const JUMP_VELOCITY = -300.0


@onready var fella_sprite: AnimatedSprite2D = $AnimatedSprite2D

func _ready():
	set_position(Vector2(Global.fellax, Global.fellay))
	
func _process(delta: float) -> void:
	Global.fellax = position.x
	Global.fellay = position.y

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta


	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("ui_left", "ui_right")
	var current_speed = WALK_SPEED

	if direction == 0:
		fella_sprite.play("default")
	elif Input.is_action_pressed("Run"):
		current_speed = RUN_SPEED
		fella_sprite.play("Running")
	else:
		fella_sprite.play("Walking")
	
	if direction < 0:
		fella_sprite.flip_h = false
	elif direction > 0:
		fella_sprite.flip_h = true
	
	
	
	if direction:
		velocity.x = direction * current_speed
	else:
		velocity.x = move_toward(velocity.x, 0, WALK_SPEED)

	move_and_slide()

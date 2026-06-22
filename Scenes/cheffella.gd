extends CharacterBody2D


const SPEED = 300.0

@onready var fella_sprite: AnimatedSprite2D = $AnimatedSprite2D

func _ready() -> void:
	global_position = Vector2(Chefglobal.playerx, Chefglobal.playery)

func _physics_process(delta: float) -> void:

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var xdirection := Input.get_axis("ui_left", "ui_right")
	if xdirection:
		velocity.x = xdirection * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		
	var ydirection := Input.get_axis("ui_up", "ui_down")
	if ydirection:
		velocity.y = ydirection * SPEED
	else:
		velocity.y = move_toward(velocity.y, 0, SPEED)

	if xdirection == 0 && ydirection == 0:
		fella_sprite.play("default")
	else:
		fella_sprite.play("walking")
		
	if xdirection < 0:
		fella_sprite.flip_h = false
	elif xdirection > 0:
		fella_sprite.flip_h = true


	move_and_slide()


func _on_chef_game_openedmenu() -> void:
	Chefglobal.playerx = position.x
	Chefglobal.playery = position.y

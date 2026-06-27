extends CharacterBody2D


const SPEED = 400.0

@onready var fella_sprite: AnimatedSprite2D = $AnimatedSprite2D

func _ready() -> void:
	pass

func _physics_process(delta: float) -> void:
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var xdirection := Input.get_axis("ui_left", "ui_right")
	if Chefglobal.canmove:
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
		elif xdirection:
			fella_sprite.play("walking")
		elif ydirection == 1:
			fella_sprite.play("walkingdown")
		elif ydirection == -1:
			fella_sprite.play("walkingup")
			
		if xdirection < 0:
			fella_sprite.flip_h = false
		elif xdirection > 0:
			fella_sprite.flip_h = true

		move_and_slide()




func _on_cabinetarea_action() -> void:
	fella_sprite.play("interacting")


func _on_fridgearea_action() -> void:
	fella_sprite.play("interacting")


func _on_sinkarea_action() -> void:
	fella_sprite.play("interacting")

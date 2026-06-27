extends AnimatableBody2D

# Keep track of where the bird was in the last frame
var last_position: Vector2

@onready var sprite: AnimatedSprite2D = $AnimatedSprite2D

func _ready() -> void:
	# Initialize the starting position
	last_position = global_position

func _process(_delta: float) -> void:
	# Calculate how much the bird moved horizontally this frame
	var horizontal_movement = global_position.x - last_position.x
	
	# If horizontal_movement is positive, it's moving RIGHT
	if horizontal_movement > 0.1:
		sprite.flip_h = true  # or false, depending on your original sprite direction
	# If horizontal_movement is negative, it's moving LEFT
	elif horizontal_movement < -0.1:
		sprite.flip_h = false # or true, depending on your original sprite direction

	# Update last_position for the next frame
	last_position = global_position

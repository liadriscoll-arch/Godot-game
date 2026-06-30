extends Sprite2D

var happy_sprite = preload("res://Assets/Sprites/happy_sprite.png.png")
var sad_sprite = preload("res://Assets/Sprites/sad_sprite.png.png")
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if Global.coffee_win:
		texture = happy_sprite
	else:
		texture = sad_sprite


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

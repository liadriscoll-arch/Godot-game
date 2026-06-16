extends Sprite2D

class_name decaf_espresso_pot


@export var empty_texture: Texture2D
@export var level_1_texture: Texture2D
@export var level_2_texture: Texture2D
@export var level_3_texture: Texture2D
@export var level_4_texture: Texture2D

func _ready():
	visible = Global.latte_discovered
	update_coffee_pot()
	

func update_coffee_pot():
	match Global.decaf_espresso_pot:
		4:
			texture = level_4_texture
		3:
			texture = level_3_texture
		2:
			texture = level_2_texture
		1:
			texture = level_1_texture
		0:
			texture = empty_texture

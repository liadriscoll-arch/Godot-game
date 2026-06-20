extends TextureButton


@onready var machine_animation: AnimatedSprite2D = $"../coffee_machine/AnimatedSprite2D"
@onready var decaf_coffee_pot: decaf_coffee_pot = $"../decaf_coffee_pot"
@onready var regular_coffee_pot: regular_coffee_pot = $"../regular_coffee_pot"
@onready var coffee_label_4: Sprite2D = $"../coffee_label4"
@onready var pot_label_4: Label = $"../pot_label4"
@onready var coffee_label_5: Sprite2D = $"../coffee_label5"
@onready var pot_label_5: Label = $"../pot_label5"



func _on_pressed() -> void:
	
	if Global.beans_used == "decaf":
		if Global.decaf_coffee_pot > 0:
			return
	else:
		if Global.regular_coffee_pot > 0:
			return

	disabled = true
	
	if Global.beans_used == "decaf" and Global.decaf_coffee_beans >= 1:
		decaf_coffee_pot.hide()
		Global.decaf_coffee_beans -= 1
		coffee_label_5.hide()
		pot_label_5.hide()
	elif Global.beans_used == "regular" and Global.regular_coffee_beans >= 1:
		regular_coffee_pot.hide()
		Global.regular_coffee_beans -= 1
		coffee_label_4.hide()
		pot_label_4.hide()
	
	if Global.beans_used == "regular" or Global.beans_used == "decaf":
	
		machine_animation.sprite_frames.set_animation_loop("coffee_fill", false)
		machine_animation.play("coffee_fill")

		await machine_animation.animation_finished
		
		machine_animation.play("default")
		
		if Global.beans_used == "decaf":
			Global.decaf_coffee_pot = 4
			decaf_coffee_pot.update_coffee_pot()
			decaf_coffee_pot.flip_h = true
			decaf_coffee_pot.show()
			coffee_label_5.show()
			pot_label_5.show()
			
		elif Global.beans_used == "regular": 
			Global.regular_coffee_pot = 4
			regular_coffee_pot.update_coffee_pot()
			regular_coffee_pot.flip_h = true
			regular_coffee_pot.show()
			coffee_label_4.show()
			pot_label_4.show()
			
		
		disabled = false
	
	
	

extends TextureButton


@onready var machine_animation: AnimatedSprite2D = $"../coffee_machine/AnimatedSprite2D"
@onready var decaf_coffee_pot: decaf_coffee_pot = $"../decaf_coffee_pot"
@onready var regular_coffee_pot: regular_coffee_pot = $"../regular_coffee_pot"


func _on_pressed() -> void:
	if Global.beans_used == "decaf":
		if Global.decaf_coffee_pot > 0:
			return
	else:
		if Global.regular_coffee_pot > 0:
			return
	
	
	
	disabled = true
	
	if Global.beans_used == "decaf":
		decaf_coffee_pot.visible = false
		Global.decaf_coffee_beans -= 1
	else: 
		regular_coffee_pot.visible = false
		Global.regular_coffee_beans -= 1
	
	machine_animation.sprite_frames.set_animation_loop("coffee_fill", false)
	machine_animation.play("coffee_fill")
	await machine_animation.animation_finished
	
	machine_animation.play("default")
	
	if Global.beans_used == "decaf":
		Global.decaf_coffee_pot = 4
		decaf_coffee_pot.update_coffee_pot()
		decaf_coffee_pot.flip_h = true
		decaf_coffee_pot.visible = true
		
	else: 
		Global.regular_coffee_pot = 4
		regular_coffee_pot.update_coffee_pot()
		regular_coffee_pot.flip_h = true
		regular_coffee_pot.visible = true
		
	
	disabled = false
	
	
	

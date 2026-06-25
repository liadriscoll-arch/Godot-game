extends TextureButton


@onready var machine_animation: AnimatedSprite2D = $"../coffee_machine/AnimatedSprite2D"
@onready var decaf_coffee_pot: decaf_coffee_pot = $"../decaf_coffee_pot"
@onready var regular_coffee_pot: regular_coffee_pot = $"../regular_coffee_pot"
@onready var coffee_label_4: Sprite2D = $"../coffee_label4"
@onready var pot_label_4: Label = $"../pot_label4"
@onready var coffee_label_5: Sprite2D = $"../coffee_label5"
@onready var pot_label_5: Label = $"../pot_label5"



func _on_pressed() -> void:
	var beans_to_brew = Global.beans_used
	Global.brewing = true

	if beans_to_brew == "decaf":
		if Global.decaf_coffee_pot > 0:
			Global.brewing = false
			return
	else:
		if Global.regular_coffee_pot > 0:
			Global.brewing = false
			return

	if beans_to_brew != "regular" and beans_to_brew != "decaf":
		Global.brewing = false
		return

	disabled = true

	if beans_to_brew == "decaf" and Global.decaf_coffee_beans.size() >= 1:
		decaf_coffee_pot.hide()
		Global.decaf_coffee_beans.remove_at(0)
		coffee_label_5.hide()
		pot_label_5.hide()
	elif beans_to_brew == "regular" and Global.regular_coffee_beans.size() >= 1:
		regular_coffee_pot.hide()
		Global.regular_coffee_beans.remove_at(0)
		coffee_label_4.hide()
		pot_label_4.hide()
	else:
		disabled = false
		return

	machine_animation.sprite_frames.set_animation_loop("coffee_fill", false)
	
	if !Global.coffee_speed_purchased:
		machine_animation.speed_scale = 1.0
	else:
		machine_animation.speed_scale = 2.0
		
	machine_animation.play("coffee_fill")

	await machine_animation.animation_finished

	machine_animation.play("default")

	if beans_to_brew == "decaf":
		Global.decaf_coffee_pot = 4
		decaf_coffee_pot.update_coffee_pot()
		decaf_coffee_pot.flip_h = true
		decaf_coffee_pot.show()
		coffee_label_5.show()
		pot_label_5.show()

	elif beans_to_brew == "regular":
		Global.regular_coffee_pot = 4
		regular_coffee_pot.update_coffee_pot()
		regular_coffee_pot.flip_h = true
		regular_coffee_pot.show()
		coffee_label_4.show()
		pot_label_4.show()

	disabled = false
	Global.brewing = false
	
	
	

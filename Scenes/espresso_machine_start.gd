extends TextureButton

@onready var machine_animation = $"../espresso_machine/AnimationPlayer"
@onready var decaf_espresso_pot: decaf_espresso_pot = $"../decaf_espresso_pot"
@onready var regular_espresso_pot: regular_espresso_pot = $"../regular_espresso_pot"


func _on_pressed() -> void:
	if Global.beans_used == "decaf":
		if Global.decaf_coffee_pot > 0:
			return
	else:
		if Global.regular_coffee_pot > 0:
			return
	disabled = true
	
	if Global.beans_used == "decaf":
		decaf_espresso_pot.visible = false
		Global.decaf_coffee_beans -= 1
	else: 
		regular_espresso_pot.visible = false
		Global.regular_coffee_beans -= 1
	
	machine_animation.sprite_frames.set_animation_loop("espresso_fill", false)
	machine_animation.play("espresso_fill")
	await machine_animation.animation_finished
	
	if Global.beans_used == "decaf":
		Global.decaf_espresso_pot = 4
		decaf_espresso_pot.update_espresso_pot()
		decaf_espresso_pot.visible = true
	else: 
		Global.regular_espresso_pot = 4
		regular_espresso_pot.update_espresso_pot()
		regular_espresso_pot.visible = true
	
	disabled = false

extends Label


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	set_text("")

func _on_gnood_mouse_entered() -> void:
	set_text("Long noodle
	-cooked in a pot for 10 seconds
	")

func _on_gnood_mouse_exited() -> void:
	set_text("")


func _on_rnood_mouse_entered() -> void:
	set_text("Short noodle
	-cooked in a pot for 10 seconds
	")


func _on_rnood_mouse_exited() -> void:
	set_text("")


func _on_ketch_mouse_entered() -> void:
	set_text("Ketchup
	-put on a burger in the assembly station
	")


func _on_ketch_mouse_exited() -> void:
	set_text("")


func _on_musta_mouse_entered() -> void:
	set_text("Mustard
	-put on a burger in the assembly station
	")


func _on_musta_mouse_exited() -> void:
	set_text("")


func _on_pbuns_mouse_entered() -> void:
	set_text("Plain bun
	-put in assembly station for burger
	")


func _on_pbuns_mouse_exited() -> void:
	set_text("")


func _on_sbuns_mouse_entered() -> void:
	set_text("Sesame bun
	-put in assembly station for burger
	")


func _on_sbuns_mouse_exited() -> void:
	set_text("")

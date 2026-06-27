extends Label

var hours = 0
var minutes = 0
var pm = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if Chefglobal.mode == 0:
			visible = false
	hours = 9
	minutes = 0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	set_text("Time:\n")
	if hours == 13:
		pm = true
		hours = 1
	if minutes == 60:
		minutes = 0
	text += str(hours) + ":"
	if minutes < 10:
		text += "0" + str(minutes)
	else:
		text += str(minutes)
	if pm:
		text += " PM"
	else:
		text += " AM"

	if Input.is_action_just_pressed("tutorialopen"):
		if visible == true:
			visible = false
		else:
			visible = true

func _on_hours_timeout() -> void:
	hours += 1

func _on_minutes_timeout() -> void:
	minutes += 1

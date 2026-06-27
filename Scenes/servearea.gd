extends Area2D

var player_inside := false
var remove = -1
var served = false
signal action
signal triggercolor
signal wrong
signal noorders

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	if player_inside and Input.is_action_just_pressed("ui_accept"):
		open_menu()

func _on_body_entered(body: Node2D) -> void:
	if body.name == "Cheffella":
		player_inside = true
		triggercolor.emit()

func _on_body_exited(body: Node2D) -> void:
	if body.name == "Cheffella":
		player_inside = false
		triggercolor.emit()

func open_menu() -> void:
	if Chefglobal.orders.size() == 0:
		noorders.emit()
		return
	for i in Chefglobal.orders.size():
		if Chefglobal.inventory == Chefglobal.orders.get(i).item1:
			Chefglobal.orders.get(i).item1 = ""
			Chefglobal.inventory = ""
			served = true
		elif Chefglobal.inventory == Chefglobal.orders.get(i).item2:
			Chefglobal.orders.get(i).item2 = ""
			Chefglobal.inventory = ""
			served = true
		elif Chefglobal.inventory == Chefglobal.orders.get(i).item3:
			Chefglobal.orders.get(i).item3 = ""
			Chefglobal.inventory = ""
			served = true
	for j in Chefglobal.orders.size():
		if (Chefglobal.orders.get(j).item1 == "" and 
		Chefglobal.orders.get(j).item2 == "" and Chefglobal.orders.get(j).item3 == ""):
			Chefglobal.totalmoney += Chefglobal.orders.get(j).money
			remove = j
	if remove != -1:
		Chefglobal.orders.remove_at(remove)
		remove = -1
	if served:
		action.emit()
	else:
		wrong.emit()
	served = false

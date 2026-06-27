extends Label


func _on_cabinetarea_invfull() -> void:
	set_text("Alerts:\n inventory full!")
	await get_tree().create_timer(1.0).timeout
	if get_text() == "Alerts:\n inventory full!":
		set_text("Alerts:\n")

func _on_trasharea_action() -> void:
	set_text("Alerts:\n inventory emptied!")
	await get_tree().create_timer(1.0).timeout
	if get_text() == "Alerts:\n inventory emptied!":
		set_text("Alerts:\n")

func _on_fridgearea_invfull() -> void:
	set_text("Alerts:\n inventory full!")
	await get_tree().create_timer(1.0).timeout
	if get_text() == "Alerts:\n inventory full!":
		set_text("Alerts:\n")


func _on_trash_2_area_action() -> void:
	set_text("Alerts:\n inventory emptied!")
	await get_tree().create_timer(1.0).timeout
	if get_text() == "Alerts:\n inventory emptied!":
		set_text("Alerts:\n")


func _on_assemblyarea_bad() -> void:
	set_text("Alerts:\nOnly dough, buns or plates first!\nThen patty, noodles, toppings, etc!")
	await get_tree().create_timer(1.0).timeout
	if get_text() == "Alerts:\nOnly dough, buns or plates first!\nThen patty, noodles, toppings, etc!":
		set_text("Alerts:\n")


func _on_piza_1_alron() -> void:
	set_text("Alerts:\nAlready on!")
	await get_tree().create_timer(1.0).timeout
	if get_text() == "Alerts:\nAlready on!":
		set_text("Alerts:\n")


func _on_piza_2_alron() -> void:
	set_text("Alerts:\nAlready on!")
	await get_tree().create_timer(1.0).timeout
	if get_text() == "Alerts:\nAlready on!":
		set_text("Alerts:\n")

func _on_piza_3_alron() -> void:
	set_text("Alerts:\nAlready on!")
	await get_tree().create_timer(1.0).timeout
	if get_text() == "Alerts:\nAlready on!":
		set_text("Alerts:\n")


func _on_piza_4_alron() -> void:
	set_text("Alerts:\nAlready on!")
	await get_tree().create_timer(1.0).timeout
	if get_text() == "Alerts:\nAlready on!":
		set_text("Alerts:\n")

func _on_piza_1_tomuch() -> void:
	set_text("Alerts:\nMax toppings!")
	await get_tree().create_timer(1.0).timeout
	if get_text() == "Alerts:\nMax toppings!":
		set_text("Alerts:\n")


func _on_piza_2_tomuch() -> void:
	set_text("Alerts:\nMax toppings!")
	await get_tree().create_timer(1.0).timeout
	if get_text() == "Alerts:\nMax toppings!":
		set_text("Alerts:\n")

func _on_piza_3_tomuch() -> void:
	set_text("Alerts:\nMax toppings!")
	await get_tree().create_timer(1.0).timeout
	if get_text() == "Alerts:\nMax toppings!":
		set_text("Alerts:\n")


func _on_piza_4_tomuch() -> void:
	set_text("Alerts:\nMax toppings!")
	await get_tree().create_timer(1.0).timeout
	if get_text() == "Alerts:\nMax toppings!":
		set_text("Alerts:\n")


func _on_burg_1_alron() -> void:
	set_text("Alerts:\nAlready on!")
	await get_tree().create_timer(1.0).timeout
	if get_text() == "Alerts:\nAlready on!":
		set_text("Alerts:\n")


func _on_burg_2_alron() -> void:
	set_text("Alerts:\nAlready on!")
	await get_tree().create_timer(1.0).timeout
	if get_text() == "Alerts:\nAlready on!":
		set_text("Alerts:\n")

func _on_burg_3_alron() -> void:
	set_text("Alerts:\nAlready on!")
	await get_tree().create_timer(1.0).timeout
	if get_text() == "Alerts:\nAlready on!":
		set_text("Alerts:\n")


func _on_burg_4_alron() -> void:
	set_text("Alerts:\nAlready on!")
	await get_tree().create_timer(1.0).timeout
	if get_text() == "Alerts:\nAlready on!":
		set_text("Alerts:\n")


func _on_burg_1_tomuch() -> void:
	set_text("Alerts:\nMax toppings!")
	await get_tree().create_timer(1.0).timeout
	if get_text() == "Alerts:\nMax toppings!":
		set_text("Alerts:\n")


func _on_burg_2_tomuch() -> void:
	set_text("Alerts:\nMax toppings!")
	await get_tree().create_timer(1.0).timeout
	if get_text() == "Alerts:\nMax toppings!":
		set_text("Alerts:\n")

func _on_burg_3_tomuch() -> void:
	set_text("Alerts:\nMax toppings!")
	await get_tree().create_timer(1.0).timeout
	if get_text() == "Alerts:\nMax toppings!":
		set_text("Alerts:\n")


func _on_burg_4_tomuch() -> void:
	set_text("Alerts:\nMax toppings!")
	await get_tree().create_timer(1.0).timeout
	if get_text() == "Alerts:\nMax toppings!":
		set_text("Alerts:\n")


func _on_orderarea_action() -> void:
	set_text("Alerts:\nOrder taken!")
	await get_tree().create_timer(1.0).timeout
	if get_text() == "Alerts:\nOrder taken!":
		set_text("Alerts:\n")


func _on_orderarea_tomany() -> void:
	set_text("Alerts:\nToo many orders!")
	await get_tree().create_timer(1.0).timeout
	if get_text() == "Alerts:\nToo many orders!":
		set_text("Alerts:\n")


func _on_orderarea_noone() -> void:
	set_text("Alerts:\nNo one to take order")
	await get_tree().create_timer(1.0).timeout
	if get_text() == "Alerts:\nNo one to take order":
		set_text("Alerts:\n")


func _on_servearea_action() -> void:
	set_text("Alerts:\nServed food!")
	await get_tree().create_timer(1.0).timeout
	if get_text() == "Alerts:\nServed food!":
		set_text("Alerts:\n")


func _on_servearea_wrong() -> void:
	set_text("Alerts:\nNot an order!")
	await get_tree().create_timer(1.0).timeout
	if get_text() == "Alerts:\nNot an order!":
		set_text("Alerts:\n")


func _on_servearea_noorders() -> void:
	set_text("Alerts:\nNo orders!")
	await get_tree().create_timer(1.0).timeout
	if get_text() == "Alerts:\nNo orders!":
		set_text("Alerts:\n")


func _on_orderbook_ordupd() -> void:
	set_text("Alerts:\nPress q to open!")
	await get_tree().create_timer(1.0).timeout
	if get_text() == "Alerts:\nPress q to open!":
		set_text("Alerts:\n")

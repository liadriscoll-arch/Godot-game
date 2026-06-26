extends Label


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	set_text("")

func _on_vburg_mouse_entered() -> void:
	set_text("Veggie Patty
	-cook in pan for 10 seconds
	")

func _on_vburg_mouse_exited() -> void:
	set_text("")


func _on_mburg_mouse_entered() -> void:
	set_text("Meat Patty
	-cook in pan for 10 seconds
	")


func _on_mburg_mouse_exited() -> void:
	set_text("")


func _on_rsauc_mouse_entered() -> void:
	set_text("Marinara Sauce
	-put on dough/noodles at assembly
	")


func _on_rsauc_mouse_exited() -> void:
	set_text("")


func _on_wsauc_mouse_entered() -> void:
	set_text("White Sauce
	-put on dough/noodles at assembly
	")


func _on_wsauc_mouse_exited() -> void:
	set_text("")


func _on_dough_mouse_entered() -> void:
	set_text("Dough
	-Cooked in oven for 30 seconds
	")


func _on_dough_mouse_exited() -> void:
	set_text("")


func _on_cfrie_mouse_entered() -> void:
	set_text("Curly Fries
	-deep fried for 10 seconds
	")


func _on_cfrie_mouse_exited() -> void:
	set_text("")


func _on_sfrie_mouse_entered() -> void:
	set_text("Straight Fries
	-deep fried for 10 seconds
	")


func _on_sfrie_mouse_exited() -> void:
	set_text("")


func _on_proni_mouse_entered() -> void:
	set_text("Pepperoni
	-put on dough at assembly
	")


func _on_proni_mouse_exited() -> void:
	set_text("")


func _on_susag_mouse_entered() -> void:
	set_text("Sausage
	-put on dough/noodles at assembly
	")


func _on_susag_mouse_exited() -> void:
	set_text("")

func _on_mushr_mouse_entered() -> void:
	set_text("Mushroom
	-put on dough at assembly station
	")


func _on_mushr_mouse_exited() -> void:
	set_text("")
	
	
func _on_chese_mouse_entered() -> void:
	set_text("Cheese
	-put on dough/burgers in assembly
	")


func _on_chese_mouse_exited() -> void:
	set_text("")


func _on_letuc_mouse_entered() -> void:
	set_text("Lettuce
	-put on burgers in assembly station
	")


func _on_letuc_mouse_exited() -> void:
	set_text("")
	
	
func _on_pickl_mouse_entered() -> void:
	set_text("Pickles
	-put on burgers in assembly station
	")


func _on_pickl_mouse_exited() -> void:
	set_text("")
	
	
func _on_pinap_mouse_entered() -> void:
	set_text("Pineapple
	-put on dough at assembly station
	")


func _on_pinap_mouse_exited() -> void:
	set_text("")
	
	
func _on_boliv_mouse_entered() -> void:
	set_text("Black Olives
	-put on dough at assembly station
	")


func _on_boliv_mouse_exited() -> void:
	set_text("")
	

func _on_bpepr_mouse_entered() -> void:
	set_text("Bell Peppers
	-put on dough at assembly station
	")


func _on_bpepr_mouse_exited() -> void:
	set_text("")
	
	
func _on_tomat_mouse_entered() -> void:
	set_text("Tomato
	-put on dough/burger at assembly
	")


func _on_tomat_mouse_exited() -> void:
	set_text("")
	
	
func _on_onion_mouse_entered() -> void:
	set_text("Onions
	-put on burgers in assembly station
	")


func _on_onion_mouse_exited() -> void:
	set_text("")

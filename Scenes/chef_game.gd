extends Node2D

signal openedmenu


@onready var spot1: Sprite2D = $Customer1
@onready var spot2: Sprite2D = $Customer2
@onready var spot3: Sprite2D = $Customer3
@onready var spot4: Sprite2D = $Customer4


var possible_customers: Array[Texture2D] = [
	preload("res://Assets/Coffee assets/customers/male_coffee_1.png"),
	preload("res://Assets/Coffee assets/customers/fem_coffee_1.webp"),
	preload("res://Assets/Coffee assets/customers/male_coffee_2.png"),
	preload("res://Assets/Coffee assets/customers/male_coffee_3.png"),
	preload("res://Assets/Coffee assets/customers/male_coffee_4.png"),
	preload("res://Assets/Coffee assets/customers/fem_coffee_2.png"),
	preload("res://Assets/Coffee assets/customers/fem_coffee_3.png"),
	preload("res://Assets/Coffee assets/customers/fem_coffee_4.png"),
	#preload("res://customer9.png"),
	#preload("res://customer10.png")
]



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	update_line()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	Global.esc_settings()


func _on_cabinetarea_action() -> void:
	openedmenu.emit()


func _on_fridgearea_action() -> void:
	openedmenu.emit()
	


func _on_customer_timer_timeout() -> void:
	try_add_customer()

func try_add_customer() -> void:
	
	if Chefglobal.customer_line.size() >= 4:
		return
	#gets chance based on user inputs
	var chance = 70
	print(chance)

	if randi_range(1, 100) <= chance:
		add_random_customer()

#adds a customer to the line
func add_random_customer() -> void:
	if Chefglobal.customer_line.size() >= 4:
		return

	var random_customer = possible_customers.pick_random()
	Chefglobal.customer_line.append(random_customer)

	#var order = make_random_order()
	#Global.customer_orders.append(order)

	update_line()
	
func update_line() -> void:
	spot1.visible = Chefglobal.customer_line.size() >= 1
	spot2.visible = Chefglobal.customer_line.size() >= 2
	spot3.visible = Chefglobal.customer_line.size() >= 3
	spot4.visible = Chefglobal.customer_line.size() >= 4
	

#checks if 1 customer is there, then adds their texture
	if Chefglobal.customer_line.size() >= 1:
		spot1.texture = Chefglobal.customer_line[0]
#checks if a 2nd customer is there, then adds their texture
	if Chefglobal.customer_line.size() >= 2:
		spot2.texture = Chefglobal.customer_line[1]
#checks if a 3rd customer is there, then adds their texture
	if Chefglobal.customer_line.size() >= 3:
		spot3.texture = Chefglobal.customer_line[2]
	if Chefglobal.customer_line.size() >= 4:
		spot3.texture = Chefglobal.customer_line[3]
	

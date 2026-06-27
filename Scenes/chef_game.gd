extends Node2D

signal openedmenu

@onready var spot1: Sprite2D = $Customer1
@onready var spot2: Sprite2D = $Customer2
@onready var spot3: Sprite2D = $Customer3
@onready var spot4: Sprite2D = $Customer4
@onready var spot5: Sprite2D = $Customer5
@onready var spot6: Sprite2D = $Customer6
@onready var spot7: Sprite2D = $Customer7

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
	add_random_customer()
	update_line()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	Global.esc_settings()
	if Input.is_action_just_pressed("orderbook"):
		openedmenu.emit()
	


func _on_customer_timer_timeout() -> void:
	try_add_customer()

func try_add_customer() -> void:
	if Chefglobal.servdcust > 0:
		add_random_cashiecust()
		Chefglobal.servdcust -= 1
	if Chefglobal.customer_line.size() >= 4:
		return
	#gets chance based on user inputs
	var chance = 50

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
	spot5.visible = Chefglobal.cashier_line.size() >= 1
	spot6.visible = Chefglobal.cashier_line.size() >= 2
	spot7.visible = Chefglobal.cashier_line.size() >= 3
	
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
		spot4.texture = Chefglobal.customer_line[3]
		
	#checks if 1 customer is there, then adds their texture
	if Chefglobal.cashier_line.size() >= 1:
		spot5.texture = Chefglobal.cashier_line[0]
	#checks if a 2nd customer is there, then adds their texture
	if Chefglobal.cashier_line.size() >= 2:
		spot6.texture = Chefglobal.cashier_line[1]
	#checks if a 3rd customer is there, then adds their texture
	if Chefglobal.cashier_line.size() >= 3:
		spot7.texture = Chefglobal.cashier_line[2]

func add_random_cashiecust() -> void:
	if Chefglobal.cashier_line.size() >= 3:
		return
	var random_customer = possible_customers.pick_random()
	Chefglobal.cashier_line.append(random_customer)
	update_line()


func _on_orderarea_action() -> void:
	update_line()


func _on_game_time_timeout() -> void:
	pass # Replace with function body.

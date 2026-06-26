extends RefCounted

var item1: String
var item2: String
var item3: String
var orders = [
	"",
	"",
	"",
	"",
	"",
	"",
	"",
	"",
	"",
	"Cooked Curly Fries",
	"Cooked Straight Fries",
	"Sesame Bun Cooked Meat Patty",
	"Sesame Bun Cooked Veggie Patty",
	"Plain Bun Cooked Meat Patty",
	"Sesame Bun Cooked Veggie Patty",
	"Cooked Marinara Ready Dough",
	"Cooked White Ready Dough",
	"Cooked White Dough",
	"Cooked Marinara Dough",
	"Sauceless\nCooked Long Noodles",
	"Sauceless\nCooked Short Noodles",
	"Marinara Sauce\nCooked Long Noodles",
	"Marinara Sauce\nCooked Short Noodles",
	"White Sauce\nCooked Long Noodles",
	"White Sauce\nCooked Short Noodles"
	]
var burgtoppings = [
	"",
	"",
	"",
	"",
	"",
	"",
	"Tomatoes",
	"Lettuce",
	"Onions",
	"Cheese",
	"Pickles",
	"Ketchup",
	"Mustard"
]
var pizzatoppings = [
	"Black Olives",
	"Bell Peppers",
	"Pineapple",
	"Pepperoni",
	"Sausage",
	"Mushrooms"
]
var money: int

func _init():
	var rand1 = randi_range(9, orders.size-1)
	var rand2 = randi_range(4, orders.size-1)
	var rand3 = randi_range(0, orders.size-1)
	var toppings1 = []
	var toppings2 = []
	var toppings3 = []
	if rand1 < 10 and rand1 < 15:
		toppings1.append(burgtoppings.get(randi_range(0, burgtoppings.size-1)))
		toppings1.append(burgtoppings.get(randi_range(0, burgtoppings.size-1)))
		toppings1.append(burgtoppings.get(randi_range(0, burgtoppings.size-1)))
	if rand2 < 10 and rand2 < 15:
		toppings2.append(burgtoppings.get(randi_range(0, burgtoppings.size-1)))
		toppings2.append(burgtoppings.get(randi_range(0, burgtoppings.size-1)))
		toppings2.append(burgtoppings.get(randi_range(0, burgtoppings.size-1)))
	if rand3 < 10 and rand3 < 15:
		toppings3.append(burgtoppings.get(randi_range(0, burgtoppings.size-1)))
		toppings3.append(burgtoppings.get(randi_range(0, burgtoppings.size-1)))
		toppings3.append(burgtoppings.get(randi_range(0, burgtoppings.size-1)))

	item1 = "T"
	money = 3

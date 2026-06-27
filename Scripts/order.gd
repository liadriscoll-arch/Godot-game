extends RefCounted
class_name order

var name: String
var item1: String
var item2: String
var item3: String
var names = [
	"Aiden", "Brandon", "Caleb", "Daniel", "Ethan", "Finn",
	"Grayson", "Henry", "Isaac", "Jack", "Kevin", "Liam",
	"Mason", "Noah", "Owen", "Parker", "Quentin", "Ryan",
	"Samuel", "Thomas", "Uriel", "Victor", "William", "Xavier",
	"Yusuf", "Zachary", "Ava", "Brooklyn", "Charlotte", "Daisy", "Emma", "Faith",
	"Grace", "Hannah", "Isabella", "Jasmine", "Kayla", "Lily",
	"Mia", "Nora", "Olivia", "Penelope", "Quinn", "Ruby",
	"Sophia", "Taylor", "Uma", "Victoria", "Willow", "Ximena",
	"Yara", "Zoe"
	]
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
	"Sauceless Cooked Long Noodles",
	"Sauceless Cooked Short Noodles",
	"Marinara Sauce Cooked Long Noodles",
	"Marinara Sauce Cooked Short Noodles",
	"White Sauce Cooked Long Noodles",
	"White Sauce Cooked Short Noodles"
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
var rand1: int
var rand2: int
var rand3: int
var toppings1 = []
var toppings2 = []
var toppings3 = []
var toppingtext: String
var boxed: bool
var randbtop = randi_range(0, burgtoppings.size()-1)
var randptop = randi_range(0, pizzatoppings.size()-1)
var bannedtop = []

func _init():
	boxed = false
	if randi_range(0, 5) == 5:
		boxed = true
	name = names.get(randi_range(0, names.size()-1))
	if boxed:
		name += " - Delivery"
	rand1 = randi_range(9, orders.size()-1)
	rand2 = randi_range(4, orders.size()-1)
	rand3 = randi_range(0, orders.size()-1)
	item1 = orders.get(rand1)
	item2 = orders.get(rand2)
	item3 = orders.get(rand3)
	if rand1 > 10 and rand1 < 15:
		for i in 4:
			toppings1.append(burgtoppings.get(randbtop))
			bannedtop.append(randbtop)
			while bannedtop.has(randbtop):
				randbtop = randi_range(0, burgtoppings.size()-1)
		bannedtop.clear()
	if rand2 > 10 and rand2 < 15:
		for i in 4:
			toppings2.append(burgtoppings.get(randbtop))
			bannedtop.append(randbtop)
			while bannedtop.has(randbtop):
				randbtop = randi_range(0, burgtoppings.size()-1)
		bannedtop.clear()
	if rand3 > 10 and rand3 < 15:
		for i in 4:
			toppings3.append(burgtoppings.get(randbtop))
			bannedtop.append(randbtop)
			while bannedtop.has(randbtop):
				randbtop = randi_range(0, burgtoppings.size()-1)
		bannedtop.clear()
	if rand1 == 17 or rand1 == 18:
		for i in 4:
			toppings1.append(pizzatoppings.get(randptop))
			bannedtop.append(randptop)
			while bannedtop.has(randptop):
				randptop = randi_range(0, pizzatoppings.size()-1)
		bannedtop.clear()
	if rand2 == 17 or rand2 == 18:
		for i in 4:
			toppings2.append(pizzatoppings.get(randptop))
			bannedtop.append(randptop)
			while bannedtop.has(randptop):
				randptop = randi_range(0, pizzatoppings.size()-1)
		bannedtop.clear()
	if rand3 == 17 or rand3 == 18:
		for i in 4:
			toppings3.append(pizzatoppings.get(randptop))
			bannedtop.append(randptop)
			while bannedtop.has(randptop):
				randptop = randi_range(0, pizzatoppings.size()-1)
		bannedtop.clear()
	toppings1 = toppings1.filter(func(item): return item.length() > 0)
	toppings2 = toppings2.filter(func(item): return item.length() > 0)
	toppings3 = toppings3.filter(func(item): return item.length() > 0)
	if toppings1 != []:
		toppingtext = ", ".join(toppings1) 
		item1 += " with " + toppingtext
	if toppings2 != []:
		toppingtext = ", ".join(toppings2) 
		item2 += " with " + toppingtext
	if toppings3 != []:
		toppingtext = ", ".join(toppings3) 
		item3 += " with " + toppingtext
	if boxed:
		item1 = "Boxed " + item1
		if item2 != "":
			item2 = "Boxed " + item2
		if item3 != "":
			item3 = "Boxed " + item3
	if "Bun" in item1:
		if "with" in item1:
			money += 15
		else:
			money += 10
	elif "Dough" in item1:
		if "Ready" in item1:
			money += 20
		else:
			money += 25
	elif "Fries" in item1:
		money += 5
	elif "Noodles" in item1:
		money += 10
	else:
		money += 0
	
	if "Bun" in item2:
		if "with" in item2:
			money += 15
		else:
			money += 10
	elif "Dough" in item2:
		if "Ready" in item2:
			money += 20
		else:
			money += 25
	elif "Fries" in item2:
		money += 5
	elif "Noodles" in item2:
		money += 10
	else:
		money += 0
		
	if "Bun" in item3:
		if "with" in item3:
			money += 15
		else:
			money += 10
	elif "Dough" in item3:
		if "Ready" in item3:
			money += 20
		else:
			money += 25
	elif "Fries" in item3:
		money += 5
	elif "Noodles" in item3:
		money += 10
	else:
		money += 0
	if boxed:
		money += 10

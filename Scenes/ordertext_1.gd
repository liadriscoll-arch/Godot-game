extends Label

var order1 = order.new() 

func _ready() -> void:
	set_text(order1.name + "\n" + order1.item1 + "\n" +
	order1.item2 + "\n" + order1.item3 + "\n" + str(order1.money))

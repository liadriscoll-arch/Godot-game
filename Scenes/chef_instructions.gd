extends Node2D


func _ready():
	MainGameMusic.stop()
	Chefglobal.endless = false
	Chefglobal.mode = 0
	Chefglobal.playerx = -905.0
	Chefglobal.playery = -332.0
	Chefglobal.day = 1
	Chefglobal.inventory = ""
	Chefglobal.assemblytable1 = ""
	Chefglobal.asempiztop1 = []
	Chefglobal.asemburgtop1 = []
	Chefglobal.assemblytable2 = ""
	Chefglobal.asempiztop2 = []
	Chefglobal.asemburgtop2 = []
	Chefglobal.assemblytable3 = ""
	Chefglobal.asempiztop3 = []
	Chefglobal.asemburgtop3 = []
	Chefglobal.assemblytable4 = ""
	Chefglobal.asempiztop4 = []
	Chefglobal.asemburgtop4 = []
	Chefglobal.plate = false
	Chefglobal.canmove = true
	Chefglobal.orders = []
	Chefglobal.customer_line = []
	
func _process(delta: float) -> void:
	Global.esc_settings()

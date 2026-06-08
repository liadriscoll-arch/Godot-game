extends Node2D


var brightness = 100
var volume = 50

@onready var volume_slider: HSlider = $volume_slider
@onready var brightness_slider: HSlider = $brightness_slider



func _ready():
	volume_slider.value = Global.volume
	brightness_slider.value = Global.brightness
	
	



func _on_brightness_slider_value_changed(new_value: float) -> void:
	Global.brightness = new_value
	$brightness_slider/Brightness_slider_label.text = str(int(new_value)) + "%"


func _on_volume_slider_value_changed(new_value: float) -> void:
	Global.volume = new_value
	$volume_slider/Volume_slider_label.text = str(int(new_value)) + "%"

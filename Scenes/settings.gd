extends Node2D


var brightness = 100
var volume = 50

@onready var volume_slider: HSlider = $volume_slider
@onready var brightness_slider: HSlider = $brightness_slider


func _get_volume_db(value: float) -> float:
	var linear_volume = max(value / 50.0, 0.0001)
	return linear_to_db(linear_volume)


func _ready():
	CoffeeShopMusic.stop()
	MainGameMusic.play_main_music()
	volume_slider.value = Global.volume
	brightness_slider.value = Global.brightness
	



func _on_brightness_slider_changed() -> void:
	_on_brightness_slider_value_changed(brightness_slider.value)


func _on_brightness_slider_value_changed(new_value: float) -> void:
	Global.brightness = new_value
	$brightness_slider/Brightness_slider_label.text = str(int(new_value)) + "%"


func _on_volume_slider_changed() -> void:
	_on_volume_slider_value_changed(volume_slider.value)


func _on_volume_slider_value_changed(new_value: float) -> void:
	Global.volume = new_value
	$volume_slider/Volume_slider_label.text = str(int(new_value)) + "%"
	CoffeeShopMusic.volume_db = _get_volume_db(new_value)
	MainGameMusic.volume_db = _get_volume_db(new_value)

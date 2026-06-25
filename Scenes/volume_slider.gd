extends HSlider

var volume = 50
func _on_Volume_slider_changed(value):
	Global.volume = value
	$Volume_slider_label.text = str(int(value)) + "%"

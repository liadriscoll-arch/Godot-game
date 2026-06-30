extends Area2D






func _on_body_entered(body: Node2D) -> void:
	$death_timer.start()




func _on_death_timer_timeout() -> void:
	Global.fellax = 40
	Global.fellay = 32
	get_tree().reload_current_scene()

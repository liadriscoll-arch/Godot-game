extends Area2D






func _on_body_entered(body: Node2D) -> void:
	$death_timer.start()




func _on_death_timer_timeout() -> void:
	get_tree().reload_current_scene()

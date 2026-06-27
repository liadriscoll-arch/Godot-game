extends AudioStreamPlayer

#const chef_music = preload("file")

func _get_volume_db(volume_scale := 1.0):
	var linear_volume = max((Global.volume / 50.0) * volume_scale, 0.0001)
	return linear_to_db(linear_volume)

func _play_music(music):
	if stream == music and playing:
		return
	
	stream = music
	# Divide by 50.0 so that a slider value of 50 becomes 1.0 (0 dB / original volume)
	volume_db = _get_volume_db()
	play()

func _process(_delta):
	# Continuously update the music volume smoothly
	volume_db = _get_volume_db()

#func play_coffee_music():
#_play_music(chef_music)

func play_sfx(stream: AudioStream, volume = 1.0):
	var fx_player = AudioStreamPlayer.new()
	fx_player.stream = stream
	fx_player.name = "FX_PLAYER"
	
	# Scale the global volume against 50, apply the local modifier, then turn to dB
	fx_player.volume_db = _get_volume_db(volume)
	
	add_child(fx_player)
	fx_player.play()
	
	await fx_player.finished
	fx_player.queue_free()

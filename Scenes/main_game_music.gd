
extends AudioStreamPlayer

const main_music = preload("res://Assets/sfx music/main_game_music.mp3")

func _play_music(music):
	if stream == music and playing:
		return
	
	stream = music
	# Divide by 50.0 so that a slider value of 50 becomes 1.0 (0 dB / original volume)
	volume_db = linear_to_db(Global.volume / 50.0) 
	play()

func _process(_delta):
	# Continuously update the music volume smoothly
	volume_db = linear_to_db(Global.volume / 50.0)

func play_main_music():
	_play_music(main_music)

func play_sfx(stream: AudioStream, volume = 1.0):
	var fx_player = AudioStreamPlayer.new()
	fx_player.stream = stream
	fx_player.name = "FX_PLAYER"
	
	# Scale the global volume against 50, apply the local modifier, then turn to dB
	fx_player.volume_db = linear_to_db((Global.volume / 50.0) * volume)
	
	add_child(fx_player)
	fx_player.play()
	
	await fx_player.finished
	fx_player.queue_free()

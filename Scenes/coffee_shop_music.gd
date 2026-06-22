extends AudioStreamPlayer

const coffee_music = preload("res://Assets/sfx music/coffee_shop_music.mp3")
# Called when the node enters the scene tree for the first time.
func _play_music(music):
	if stream == music and playing:
		return

	stream = music
	if Global.volume == 0:
		volume_db = 0
	else:
		volume_db = (Global.volume - 50)/2
	play()
	

func play_coffee_music():
	_play_music(coffee_music)
func play_sfx(stream: AudioStream, volume = 0.0):
	var fx_player = AudioStreamPlayer.new()
	fx_player.stream = stream
	fx_player.name = "FX_PLAYER"
	if Global.volume == 0:
		fx_player.volume_db = 0
	else:
		fx_player.volume_db = (Global.volume - 50)/2
	add_child(fx_player)
	fx_player.play()
	
	await fx_player.finished
	
	fx_player.queue_free()

func _process(_delta):
	volume_db = (Global.volume - 50) / 2.0

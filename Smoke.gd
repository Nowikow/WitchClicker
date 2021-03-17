extends AnimatedSprite

func Appear():
	show()
	play()
	yield(get_tree().create_timer(.6), "timeout")
	hide()

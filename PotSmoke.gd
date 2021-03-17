extends AnimatedSprite

func _on_PotSmoke_animation_finished():
	hide()

func Appear():
	set_frame(0)
	show()
	play()

extends AnimatedSprite

func ClockSmokeAppear():
	show()
	play()

func _on_ClockSmoke_animation_finished():
	yield(get_tree().create_timer(1.1), "timeout")
	hide()

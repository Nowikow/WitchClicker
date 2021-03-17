extends AnimatedSprite

signal LegFinished

func _on_Leg_animation_finished():
	set_frame(0)
	hide()
	emit_signal("LegFinished")

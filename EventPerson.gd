extends AnimatedSprite

signal Exit

var End=false

func Mover(Vector, IsEnd):
	$Tween.interpolate_property(self, "position", get_position(), Vector, 0.75, $Tween.TRANS_ELASTIC, $Tween.EASE_OUT)
	$Tween.start()
	End=IsEnd

func _on_Tween_tween_all_completed():
	if End:
		emit_signal("Exit")

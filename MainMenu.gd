extends TextureRect

var IsPressed=false

func Slide():
	$Tween.interpolate_property(self, "rect_position", Vector2(1.064, -1934.13), Vector2(0, 0), 0.4, $Tween.TRANS_LINEAR, $Tween.EASE_OUT)
	$Tween.start()

func SlideBack():
	$Tween.interpolate_property(self, "rect_position", Vector2(0, 0), Vector2(1.064, -1934.13), 0.4, $Tween.TRANS_LINEAR, $Tween.EASE_OUT)
	$Tween.start()

#SoundNode
func PlaySound():
	$Click.play()

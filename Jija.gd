extends Sprite

func _ready():
	set_modulate(Color(0.2, 0.4, 0.2, 1.0))

func ChangeColor(SinParam):
	var FinalColor
	if SinParam>0:
		FinalColor=Color(0.4, 0.5+SinParam/20, 0.9+SinParam/15, 0.5+SinParam/20)
	elif SinParam==0:
		FinalColor=Color(0.2, 0.4, 0.2, 1.0)
	elif SinParam<0:
		FinalColor=Color(0.8, 0.4-SinParam/25, 0.4-SinParam/25, 0.5-SinParam/20)

	$Tween.interpolate_property(self, "modulate", Color(get_modulate()), FinalColor, 1, $Tween.TRANS_LINEAR, $Tween.EASE_OUT)
	$Tween.start()

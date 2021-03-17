extends ScrollContainer

func Scroll():
	var LastWitchPosition=1920*(Global.NumberOfBrunches)
	var PreLastWitchPosition=1920*(Global.NumberOfBrunches-2)
	$Tween.interpolate_property(self, "scroll_vertical", PreLastWitchPosition, LastWitchPosition, 1.5, $Tween.TRANS_LINEAR, $Tween.EASE_IN)
	$Tween.start()

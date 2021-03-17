extends TextureRect

var CurrentType='Dog'

var IsPressed=false

#Appear logic
func Slide():
	$Tween.interpolate_property(self, "rect_position", Vector2(-1200,0), Vector2(0,0), 0.3, $Tween.TRANS_LINEAR, $Tween.EASE_OUT)
	$Tween.start()

func SlideBack():
	$Tween.interpolate_property(self, "rect_position", Vector2(0,0), Vector2(-1200,0), 0.3, $Tween.TRANS_LINEAR, $Tween.EASE_OUT)
	$Tween.start()

#Make a description
func Description(Type):
	CurrentType=Type

	$BuyPopup.IsOpen=true
	$KovenBoard.hide()

	$BuyPopup/Name/NameLabel.text=Global.Coven[Type]['Name']
	$BuyPopup/TextTable/Description.text=Global.Coven[Type]['Description']
	$BuyPopup/TextTable/Current.text=str(Global.Coven[Type]['CurrentLevel'])
	$BuyPopup/TextTable/Next.text=str(Global.Coven[Type]['NextLevel'])
	$BuyPopup/TextTable/Level.text=str(Global.Coven[Type]['Level'])
	$BuyPopup/BuyButton/Cost.text=str(Global.Coven[Type]['Price'])
	$BuyPopup/Picture.set_animation(Global.Coven[Type]['Animation'])

	$BuyPopup.show()

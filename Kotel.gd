extends TextureButton

var Inside=[]
var SinParam=0

func _process(_delta):
	$TestLabel.text=str(SinParam)

#Cooking logic
func StartCooking():
	$Burn.show()
	$Jija.ChangeColor(SinParam)

func FinishCooking():
	disabled=false
	$Burn.hide()
	$PotSmoke.Appear()
	WobWob()

func WobWob():
	$KotelTween.interpolate_property(self, "rect_position", Vector2(rect_position.x, rect_position.y-50), Vector2(rect_position.x, rect_position.y), 2, $Jija/Tween.TRANS_ELASTIC, $Jija/Tween.EASE_OUT)
	$KotelTween.repeat=true
	$KotelTween.start()

func GiveToPatient():
	disabled=true
	$KotelTween.repeat=false
	Inside=[]
	SinParam=0

#Clear Kotel
func Clear():
	$Jija.ChangeColor(0)
	$Burn.hide()
	$KotelTween.repeat=false
	disabled=true
	Inside=[]
	SinParam=0

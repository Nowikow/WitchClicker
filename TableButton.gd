extends TextureButton

signal Pressed

var Type
var Sin

var TweenStage=0

func _process(_delta):
	$Ammount/AmmountLabel.set_text(str(Global.ShopItems[Type]['Ammount']))

func _ready():
	if Global.ShopItems[Type]['Ammount']==-1:
		 $Ammount.hide()
	
	if Sin>0:
		$LightIngrid.set_color(Color(0, 0, Sin/2, 1.0))
	elif Sin<0:
		$LightIngrid.set_color(Color(-Sin/2, 0, 0, 1.0))
	else:
		$LightIngrid.set_color(Color(0, 0, 0, 0))

func _on_TableButton_pressed():
	PressOnbutton()

func PressOnbutton():
	disabled=true
	if Global.ShopItems[Type]['Ammount']>0:
		Global.ShopItems[Type]['Ammount']-=1

	$Tween.interpolate_property(self, "rect_scale", Vector2(1.5, 0.5), Vector2(1.0, 1.0), 0.55, $Tween.TRANS_ELASTIC, $Tween.EASE_OUT)
	$Tween.start()

func _on_Tween_tween_all_completed():
	emit_signal("Pressed", Type, Sin)
	DeleteIt()

func DeleteIt():
	$Smoke.show()
	$Smoke.play()

func _on_Smoke_animation_finished():
	hide()

extends TextureButton

var IsMove=false
var Sin
var Type
var Count

func _ready():
	if Sin>0:
		$LightIngrid.set_color(Color(0, 0, Sin/2, 1.0))
	elif Sin<0:
		$LightIngrid.set_color(Color(-Sin/2, 0, 0, 1.0))
	else:
		$LightIngrid.set_color(Color(0, 0, 0, 0))
	
	$Ammount/AmmountLabel.text=str(Global.ShopItems[Type]['Ammount'])
	Move()

func _on_ShopButtonPandora_pressed():
	$Tween.interpolate_property(self, "rect_scale", Vector2(1.5, 0.5), Vector2(1.0, 1.0), 0.75, $Tween.TRANS_ELASTIC, $Tween.EASE_OUT)
	$Tween.start()
	Disapear()

func Disapear():
	$Tween.interpolate_property(self, "rect_scale", Vector2(1.5, 0.5), Vector2(1.0, 1.0), 0.75, $Tween.TRANS_ELASTIC, $Tween.EASE_OUT)
	$Tween.start()

	yield(get_tree().create_timer(.4), "timeout")
	queue_free()

func Move():
	IsMove=true
	match Count:
		0:
			MoveTween(Vector2(-470, -500))
		1:
			MoveTween(Vector2(-70, -500))
		2:
			MoveTween(Vector2(280, -500))

func MoveTween(Vector):
	$Tween.interpolate_property(self, "rect_position", get_position(), Vector, .7, $Tween.TRANS_LINEAR, $Tween.EASE_OUT)
	$Tween.interpolate_property(self, "rect_scale", Vector2(0,0), get_scale(), .7, $Tween.TRANS_LINEAR, $Tween.EASE_OUT)
	$Tween.start()


func _on_Tween_tween_all_completed():
	if IsMove:
		IsMove=false
		$Tween.interpolate_property(self, "rect_scale", Vector2(1.1, 1.1), Vector2(0.8, 0.8), 0.75, $Tween.TRANS_ELASTIC, $Tween.EASE_OUT)
		$Tween.repeat=true
		$Tween.start()

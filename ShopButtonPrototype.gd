extends TextureButton

func _on_ShopButtonPrototype_pressed():
	$Tween.interpolate_property(self, "rect_scale", Vector2(1.5, 0.5), Vector2(1.0, 1.0), 0.75, $Tween.TRANS_ELASTIC, $Tween.EASE_OUT)
	$Tween.start()

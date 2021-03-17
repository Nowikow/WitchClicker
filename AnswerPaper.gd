extends TextureButton

func _ready():
	visible = false
	rect_position = Vector2(70.0, 1830.0)

func _on_AnswerPaper_pressed():
	get_parent().get_node("EPAnimationOut").play("AnimOut")

#Connected with EventModule.gd when start Random Key Event (IsAnswer == true)
func _on_EventModule_is_key_answer():
	visible = true
	$Tween.interpolate_property(self, "rect_position", Vector2(70.0, 1829.0), Vector2(70.0, 1305.0), 1.0, $Tween.TRANS_EXPO, $Tween.EASE_OUT)
	$Tween.start()

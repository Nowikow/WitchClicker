extends Area2D

func _ready():
	visible = false

func _on_Hands_body_exited(body):
	$Tween.interpolate_property($TextureButton, "rect_scale",  Vector2(0.6, 0.6), Vector2(1.3, 1.3), 0.2, $Tween.TRANS_SINE, $Tween.EASE_IN_OUT)
	$Tween.start()

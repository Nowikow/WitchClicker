extends KinematicBody2D

#Paper is over the screen. Signal to EventModule.gd
signal event_paper_out

func _unhandled_input(event):
	if event is InputEventScreenTouch:
		if event.pressed:
			on_touch_pressed(event)
		else:
			on_touch_released(event)
	if event is InputEventScreenDrag:
		on_touch_drag(event)

func on_touch_pressed(event):
	pass

#Paper movement over the screen bounds
func on_touch_released(event):
	if position == Vector2(-200.0, position.y):
		paper_interpolate(Vector2(-200.0, 1305.0), Vector2(-1500.0, 1305.0), 0.6)
		get_parent().get_node("Hands").visible = false
		emit_signal("event_paper_out")
		
	elif position == Vector2(300.0, position.y):
		paper_interpolate(Vector2(400.0, 1305.0), Vector2(1500.0, 1305.0), 0.6)
		get_parent().get_node("Hands2").visible = false
		emit_signal("event_paper_out")
		
	elif position.x > -200 && position.x < 300:
		paper_interpolate(Vector2(100.0, 1305.0), Vector2(70.0, 1305.0), 0.3)
		get_parent().get_node("Hands").visible = false
		get_parent().get_node("Hands2").visible = false

#Left and Right Movement
func on_touch_drag(event):
	if event.relative.x > 0:
		position += Vector2(30.0, 0.0)
		if position > Vector2(300.0, 0.0):
			position = Vector2(300.0, position.y)
			get_parent().get_node("Hands").visible = false
			get_parent().get_node("Hands2").visible = true
	if event.relative.x < 0:
		position += Vector2(-30.0, 0.0)
		if position < Vector2(-200.0, 0.0):
			get_parent().get_node("Hands").visible = true
			get_parent().get_node("Hands2").visible = false
			position = Vector2(-200.0, position.y)

func paper_interpolate(start_vector, finish_vector, life_time):
	$Tween.interpolate_property(self, "position", start_vector, finish_vector, life_time, $Tween.TRANS_EXPO, $Tween.EASE_OUT)
	$Tween.start()


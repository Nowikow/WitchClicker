extends ParallaxBackground

#Scrolling mechanic

var StartPosition
var CurrentPosition

func _process(_delta):
	CurrentPosition=get_viewport().get_mouse_position()

func _on_TableArea_input_event(_viewport, event, _shape_idx):
	if event.is_action_pressed("click"):
		StartPosition=get_viewport().get_mouse_position()
	if event.is_action_released("click"):
		CalculateSwipe()

func CalculateSwipe():
	if StartPosition.x-CurrentPosition.x>0:
		$TableParallax.motion_offset.x-=360
	elif StartPosition.x-CurrentPosition.x<0:
		$TableParallax.motion_offset.x+=360

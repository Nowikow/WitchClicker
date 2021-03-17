extends Node2D

func _ready():
	get_node("Fader/AnimationPlayerIn").play("In")


func _input(event):
	if(event is InputEventMouseButton):
		_select_language_screen()


func _on_AnimationPlayerIn_animation_finished(_anim_name):
	yield(get_tree().create_timer(1), "timeout")
	get_node("Fader/AnimationPlayerOut").play("Out")


func _on_AnimationPlayerOut_animation_finished(_anim_name):
	_select_language_screen()

func _select_language_screen():
	Global.changer("res://Scenes/SelectLanguageScreen.tscn", true, 'Language')

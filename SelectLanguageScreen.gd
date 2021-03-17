extends Node2D

func _ready():
	$Fader/AnimationPlayerIn.play("In")

func _on_EnglishLanguageButton_pressed():
	$Fader/AnimationPlayerOut.play("Out")

func _on_RussianLanguageButton_pressed():
	$Fader/AnimationPlayerOut.play("Out")

func _on_AnimationPlayerOut_animation_finished(_anim_name):
	Global.changer("res://Scenes/FamilieTree.tscn", false, 'Tree')

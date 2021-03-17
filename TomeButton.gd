extends "res://Scripts/ButtonMenuPrototype.gd"

func _on_TomeButton_pressed():
	Global.changer("res://Scenes/FamilieTree.tscn", true, 'Tree')

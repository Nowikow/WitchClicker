extends "res://Scripts/ButtonMenuPrototype.gd"

func _on_ShopButton_pressed():
	yield(get_tree().create_timer(.3), "timeout")
	Global.changer("res://Scenes/Loader.tscn", true, 'Shop')

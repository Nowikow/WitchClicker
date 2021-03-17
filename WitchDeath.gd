extends Node2D

func _ready():
	if Global.Load == 'Burn':
		$Burning.show()
	else:
		$TakenDemons.show()

func _input(event):
	if event is InputEventMouseButton:
		Global.IsDead=true
		Global.changer('res://Scenes/FamilieTree.tscn', true, 'Tree')



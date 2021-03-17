extends Area2D

var PeasantSin

func _ready():
	randomize()
	PeasantSin=randi()%20

	Transformer()

	yield(get_tree().create_timer(1), "timeout")
	Mover(Vector2(0, 0), Vector2(900, 0))

#Enter/exit logic
func Mover(vector1, vector2):
	$Tween.interpolate_property(self, "position", vector1, vector2, 0.75, $Tween.TRANS_ELASTIC, $Tween.EASE_OUT)
	$Tween.start()

#exit from scene logic
func _on_PeasantPrototypeMan_tree_exited():
	queue_free()

#Creating this peasant
func Create():
	pass

#Transform logic
func Transformer():
	$PartOfBody.ChangeParts(PeasantSin)

#Go away logic
var CurrentPosition
var StartPosition

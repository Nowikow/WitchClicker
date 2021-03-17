extends Node2D

signal is_key_answer
signal EndOfEvent

var cat=preload('res://Scenes/Cat.tscn')

var TypeOfEvent

var CurrentEvent
var IsAnswer

var events = Global.event_creator()
var GameStart=Global.GameStart()
var Cats=Global.DevilCat()

func _ready():
	randomize()
	var IsCat=randi()%3

	match TypeOfEvent:
		'RandomEvent':
			if IsCat==0:
				CurrentEvent=Cats[randi() % Cats.keys().size()]
				IsCat=-1
				$EventPerson.hide()
			else:
				CurrentEvent = events[randi() % events.keys().size()]
		'StartOfTheGame':
			CurrentEvent=GameStart

	var CurrentEventAnimation = CurrentEvent["Animation"]
		
	$EventPerson.set_animation(CurrentEventAnimation)
	$EventPaper/Label.text = CurrentEvent["Question"]
	IsAnswer = CurrentEvent["Is Answer"]
			
	$EventPerson.Mover(Vector2(30,0),false)
	$EPAnimationIn.play("AnimIn")

	yield(get_tree().create_timer(1), "timeout")

#Add a cat
	if IsCat==-1:
		var Cat=cat.instance()
		Cat.IsScript=true
		$CatPosition.add_child(Cat)

#if IsAnswer == false, start Event, if not, start Random Key Event
func _on_EventPaper_event_paper_out():
	if IsAnswer == true:
		emit_signal("is_key_answer")
		if $EventPaper.position < Vector2(0.0, 1305.0):
			key_event("PositiveAnswer", "PositiveEffect")
		if $EventPaper.position > Vector2(0.0, 1305.0):
			key_event("NegativeAnswer", "NegativeEffect")
		
	if IsAnswer == false:
		$EventPerson.Mover(Vector2(1200, 0), true)
		$EPAnimationOut.play("AnimOut")

		if $EventPaper.position < Vector2(0.0, 1305.0):
			if TypeOfEvent=='StartOfTheGame':
				Global.Coin=0

		elif $EventPaper.position > Vector2(0.0, 1305.0):
			if TypeOfEvent=='StartOfTheGame':
				Global.Coin=0
	
	emit_signal("EndOfEvent")

#Random Key Event
func key_event(answer, effect):
	$AnswerPaper/Label.text = CurrentEvent[answer][randi() % CurrentEvent[answer].size()]
	$Effect.text = CurrentEvent[effect][randi() % CurrentEvent[effect].size()]

func _on_EPAnimationIn_animation_finished(anim_name):
	$PaperIn.play("AnimIn")

func _on_EventPerson_Exit():
	queue_free()

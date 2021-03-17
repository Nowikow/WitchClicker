extends ProgressBar

func _process(delta):
	$TestLabel.text=str(int(value))
	value-=delta
	$ManaButton/ManaLight.energy=value*0.02

func _on_ManaButton_pressed():
	value+=2

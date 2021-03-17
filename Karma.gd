extends HSlider

func _ready():
	value=max_value/2

func _process(_delta):
	$TestLabel.text=str(value)

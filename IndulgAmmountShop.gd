extends Label

func _process(_delta):
	set_text(str(Global.ShopItems['Indulgence']['Ammount']))

extends TextureRect

var BuyItem

var pandoraButton=preload('res://Scenes/ShopButtonPandora.tscn')
var ButtonArray=Global.ShopItems.keys()

func _ready():
	PriceFiller()

#Fill price 
func PriceFiller():
	$Table/GoatHead/PriceBoard/Label.text=str(Global.ShopItems['GoatHead']['Price'])
	$Table/PandoraBox/PriceBoard/Label.text=str(Global.ShopItems['Pandora']['Price'])
	$Table/Indulgence/PriceBoard/Label.text=str(Global.ShopItems['Indulgence']['Price'])

#Press on item
func ItemPresser(Type):
#Delete pandora items
	if $Table/PandoraStartPosition.get_child_count()>0:
		for key in $Table/PandoraStartPosition.get_children():
			key.Disapear()

#Making a board info
	BuyItem=Type

	$Board/DescriptionNode/Name.text=Global.ShopItems[Type]['Name']
	$Board/DescriptionNode/Description.text=Global.ShopItems[Type]['Description']

	$Board/DescriptionNode.show()

#Menu button logic
func _on_ButtonMenuPrototype_pressed():
	if $Gui/MainMenu.IsPressed:
		$Gui/MainMenu.IsPressed=false
		$Gui/MainMenu.SlideBack()
	else:
		$Gui/MainMenu.IsPressed=true
		$Gui/MainMenu.Slide()

#BuyLogic
func _on_BuyButton_pressed():
#Delete pandora items
	if $Table/PandoraStartPosition.get_child_count()>0:
		for key in $Table/PandoraStartPosition.get_children():
			key.Disapear()

#Buying module
	if Global.Coin>=Global.ShopItems[BuyItem]['Price']:
		if BuyItem!='Pandora':
			Global.Coin-=Global.ShopItems[BuyItem]['Price']
			Global.ShopItems[BuyItem]['Ammount']+=1
		else:
			$Board/DescriptionNode/BuyButton.disabled=true
			$Table/PandoraBox.disabled=true
			$Table/PandoraBox.texture_disabled.set_current_frame(0)
			Global.Coin-=Global.ShopItems[BuyItem]['Price']

			yield(get_tree().create_timer(1), "timeout")
			$Board/DescriptionNode/BuyButton.disabled=false
			$Table/PandoraBox.disabled=false
			PushThreeThings()

#Pandora buying logic
func PushThreeThings():
	var Count=0
	while Count<3:
		var PandoraButtonType=ButtonArray[randi()%ButtonArray.size()]
		print(PandoraButtonType)

		match Count:
			0:
				while Global.ShopItems[PandoraButtonType]['Tir']!=3:
					PandoraButtonType=ButtonArray[randi()%ButtonArray.size()]
			1:
				while Global.ShopItems[PandoraButtonType]['Tir']!=2:
					PandoraButtonType=ButtonArray[randi()%ButtonArray.size()]
			2:
				while ((Global.ShopItems[PandoraButtonType]['Tir']!=2)):
					PandoraButtonType=ButtonArray[randi()%ButtonArray.size()]
					while $Table/PandoraStartPosition.get_child(1).Type==Global.ShopItems[PandoraButtonType]['Type']:
						PandoraButtonType=ButtonArray[randi()%ButtonArray.size()]
	
		var PandoraButton=pandoraButton.instance()
		PandoraButton.texture_normal=Global.ShopItems[PandoraButtonType]['Texture']
		PandoraButton.Type=Global.ShopItems[PandoraButtonType]['Type']
		PandoraButton.Sin=Global.ShopItems[PandoraButtonType]['Sin']
		PandoraButton.Count=Count
		Global.ShopItems[PandoraButtonType]['Ammount']+=1

		$Table/PandoraStartPosition.add_child(PandoraButton)
		Count+=1

extends TextureRect

var BuildButtonTexture=preload('res://Sprites/Koven/build_icon.png')
var BackButtonTexture=preload('res://Sprites/Koven/icon_back.png')

#CovenGenerator
func _ready():
	Global.CovenStructure()

	for object in $Environment.get_children():
		if Global.Coven[object.get_name()]['IsBuild']:
			BuildAppear(object)

#Coven appear function
func BuildAppear(object):
	$Tween.interpolate_property(object, "modulate", Color(1.0, 1.0, 1.0, 0), Color(1.0, 1.0, 1.0, 1.0), 0.2, $Tween.TRANS_LINEAR, $Tween.EASE_IN)
	$Tween.start()

#MenuLogic
func _on_MenuButton_pressed():
	ButtonPresser($MainMenu, $GUI/BuildButton)

func _on_BuildButton_pressed():
	ButtonPresser($BuildBoard, $GUI/MenuButton)

func ButtonPresser(MenuNode, ButtonNode):
	if MenuNode.IsPressed:
		if $BuildBoard/BuyPopup.IsOpen:
			$BuildBoard/BuyPopup.IsOpen=false

			$GUI/BuildButton.texture_normal=BuildButtonTexture
			$GUI/Control.hide()

			$BuildBoard/BuyPopup.hide()
			$BuildBoard/KovenBoard.show()
		else:
			MenuNode.SlideBack()
			MenuNode.IsPressed=false
			ButtonNode.disabled=false
	else:
		MenuNode.Slide()
		MenuNode.IsPressed=true
		ButtonNode.disabled=true

#Coven build logic
func ShowDescription(Type):
	$GUI/BuildButton.texture_normal=BackButtonTexture
	$GUI/Control.show()
	$BuildBoard.Description(Type)

func _on_BuyButton_pressed():
	if Global.Coin>=Global.Coven[$BuildBoard.CurrentType]['Price']:
		$BuildBoard.hide()
		$GUI/MenuButton.hide()
		$GUI/BuildButton.hide()
		
		Global.Coven[$BuildBoard.CurrentType]['Effect']
		Global.Coven[$BuildBoard.CurrentType]['Price']+=Global.Coven[$BuildBoard.CurrentType]['Price']/10
		Global.Coven[$BuildBoard.CurrentType]['Level']+=1
		
		if Global.Coven[$BuildBoard.CurrentType]['IsBuild']==false:
			BuildAppear($Environment.get_node($BuildBoard.CurrentType))
			Global.Coven[$BuildBoard.CurrentType]['IsBuild']=true

		yield(get_tree().create_timer(1.2), "timeout")

		$BuildBoard.show()
		$GUI/MenuButton.show()
		$GUI/BuildButton.show()

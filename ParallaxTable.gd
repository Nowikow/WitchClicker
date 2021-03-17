extends Node2D

signal ThrowIntoKotel

var button=preload('res://Scenes/TableButton.tscn')
var table=preload('res://Scenes/TableForDublicat.tscn')

var ingridArray=Global.ShopItems.keys()
var ButtonArray=[]

var TablePositionIndex=5

var IsBlocked=false

func _ready():
	FullTable()
	$TableTimer.start()

func Random():
	randomize()
	var AmmountOfButtons=0

	while AmmountOfButtons<5:
		AddNewButtonInArray()
		AmmountOfButtons+=1

func AddNewButtonInArray():
	randomize()
	var TempButton=ingridArray[randi()%ingridArray.size()]

	while ButtonArray.find(TempButton)!=-1:
		randomize()
		TempButton=ingridArray[randi()%ingridArray.size()]

	if Global.ShopItems[TempButton]['Ammount']==0:
		AddNewButtonInArray()
	else:
		ButtonArray.append(TempButton)

func FullTable():
	Random()
	var k=0
	for key in ButtonArray:
		var ButtonIngrid=button.instance()
		ButtonIngrid.connect("Pressed", $".", 'ButtonPresser')

		ButtonIngrid.texture_normal=Global.ShopItems[key]['Texture']
		ButtonIngrid.Type=Global.ShopItems[key]['Type']
		ButtonIngrid.Sin=Global.ShopItems[key]['Sin']

		ButtonIngrid.set_position(Vector2(270*k, 1160))

		k+=1
		$Ingridients.add_child(ButtonIngrid)

func OffsetScroll():
	$Tween.interpolate_property($Ingridients, "position", Vector2($Ingridients.get_position()), Vector2($Ingridients.position.x-270, $Ingridients.position.y), 0.5, $Tween.TRANS_LINEAR, $Tween.EASE_OUT)
	
	for table in $TableNode.get_children():
		$Tween.interpolate_property(table, "position", Vector2(table.get_position()), Vector2(table.position.x-270, table.position.y), 0.5, $Tween.TRANS_LINEAR, $Tween.EASE_OUT)
	$Tween.start()

func _on_TableTimer_timeout():
	OffsetScroll()

func _on_Tween_tween_all_completed():
	$Ingridients.get_children()[0].queue_free()
	ButtonArray.remove(0)

	AddNewButtonInArray()
	var ButtonIngrid=button.instance()
	ButtonIngrid.connect("Pressed", $".", 'ButtonPresser')

	ButtonIngrid.texture_normal=Global.ShopItems[ButtonArray[4]]['Texture']
	ButtonIngrid.Type=Global.ShopItems[ButtonArray[4]]['Type']
	ButtonIngrid.Sin=Global.ShopItems[ButtonArray[4]]['Sin']
	ButtonIngrid.disabled=IsBlocked

	ButtonIngrid.set_position(Vector2(270*TablePositionIndex, 1160))
	TablePositionIndex+=1

	$Ingridients.add_child(ButtonIngrid)

	if $TableNode.get_child(0).position.x==-270:
		var Table=table.instance()
		Table.set_position(Vector2(1080, 1160))
		$TableNode.add_child(Table)
	elif $TableNode.get_child(0).position.x==-1350:
		$TableNode.get_child(0).queue_free()
	$TableTimer.start()

func ButtonPresser(Type, Sin):
	emit_signal("ThrowIntoKotel", Type, Sin)

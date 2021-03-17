extends Sprite

signal ThrowIntoKotel

var ingridArray=Global.IngridArray
var button=preload("res://Scenes/TableButton.tscn")

func _ready():
#Create ingridient list
	var k=0
	for key in ingridArray:
		var ButtonIngrid=button.instance()
		ButtonIngrid.connect("Pressed", $".", 'ButtonPresser')

		ButtonIngrid.texture_normal=key[0]
		ButtonIngrid.Type=key[1]
		ButtonIngrid.Sin=key[2]

		ButtonIngrid.Index=k
		k+=1

		$Table/Container.add_child(ButtonIngrid)

func ButtonPresser(Type, Sin):
	emit_signal("ThrowIntoKotel", Type, Sin)

##Revolver logic
var StartPosition

func _on_Table_scroll_ended():
	while $Table.get_h_scroll()%270!=0:
		if $Table.get_h_scroll()%270<135:
			$Table.set_h_scroll($Table.get_h_scroll()-1)
		else:
			$Table.set_h_scroll($Table.get_h_scroll()+1)

func _on_Table_scroll_started():
	StartPosition=$Table.get_h_scroll()

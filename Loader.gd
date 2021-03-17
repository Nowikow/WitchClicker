extends AnimatedSprite

var loader
var currentscene
var prevScene

func _ready():
	var root = get_tree().get_root()
	currentscene = root.get_child(root.get_child_count() -1)
#	root.get_child(root.get_child_count() -2).queue_free()
	
	match Global.Load:
		'Menu':
			goto_scene('res://Scenes/MainMenu.tscn')
		'Language':
			goto_scene('res://Scenes/SelectLanguageScreen.tscn')
		'Coven':
			goto_scene('res://Scenes/Coven.tscn')
		'Shop':
			goto_scene('res://Scenes/Shop.tscn')
		'Haus':
			goto_scene('res://Scenes/Haus.tscn')
		'Catch', 'Burn':
			goto_scene('res://Scenes/WitchDeath.tscn')
		'Tree':
			goto_scene('res://Scenes/FamilieTree.tscn')

func goto_scene(path):
	loader = ResourceLoader.load_interactive(path)
	set_process(true)

func _process(_delta):
	if loader.poll() == ERR_FILE_EOF:
		set_process(false)
		yield(get_tree().create_timer(1.5), "timeout")
		currentscene.queue_free()

		get_node("/root").add_child(loader.get_resource().instance())

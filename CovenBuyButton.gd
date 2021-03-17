extends TextureButton

signal Pressed

var Type

func _ready():
	match texture_normal:
		preload('res://Sprites/Koven/KovenBuyModule/icon_cave.png'):
			Type='Chest'
		preload('res://Sprites/Koven/KovenBuyModule/icon_demon_trap.png'):
			Type='Trap'
		preload('res://Sprites/Koven/KovenBuyModule/icon_dog.png'):
			Type='Dog'
		preload('res://Sprites/Koven/KovenBuyModule/icon_fairy_tree.png'):
			Type='FairyTree'
		preload('res://Sprites/Koven/KovenBuyModule/icon_garden.png'):
			Type='Garden'
		preload('res://Sprites/Koven/KovenBuyModule/icon_graveyard.png'):
			Type='Graveyard'
		preload('res://Sprites/Koven/KovenBuyModule/icon_hedge.png'):
			Type='Isgorod'
		preload('res://Sprites/Koven/KovenBuyModule/icon_mushrooms.png'):
			Type='Mashroom'
		preload('res://Sprites/Koven/KovenBuyModule/icon_pot.png'):
			Type='Pot'
		preload('res://Sprites/Koven/KovenBuyModule/icon_stonehange.png'):
			Type='StoneH'
		preload('res://Sprites/Koven/KovenBuyModule/icon_tree_view.png'):
			Type='FairyTree'
		preload('res://Sprites/Koven/KovenBuyModule/icon_witch_assistant_house.png'):
			Type='WitchAss'
		preload('res://Sprites/Koven/KovenBuyModule/icon_witch_house.png'):
			Type='WitchHaus'

func _on_CovenButton_pressed():
	$Tween.interpolate_property(self, "rect_scale", Vector2(1.5, 1.5), Vector2(1.0, 1.0), 0.75, $Tween.TRANS_ELASTIC, $Tween.EASE_OUT)
	$Tween.start()

func _on_Tween_tween_all_completed():
	emit_signal("Pressed", Type)

extends Node2D

#Scene transition
var Load

func changer(path, toLoader, loadType):

	if toLoader:
		Load=loadType
		get_tree().change_scene("res://Scenes/Loader.tscn")
	else:
		get_tree().change_scene(path)

	get_tree().get_root().get_child(get_tree().get_root().get_child_count()-1).queue_free()

#Familie Tree variables
var Witches=[]
var NumberOfBrunches=1
var IsDead=false

var WitchNames=['Альба', 'Агнесса', 'Агата', 'Агриппина', 'Адель', 'Анита', 'Анна', 'Анастасия', 'Анжела', 'Алиса', 'Амелия', 'Аурелия', 'Алина', 'Адрианна', 'Барбара', 'Берта', 'Бланш', 'Беатриса', 'Бриджит', 'Валентина', 'Генриетта', 'Гизела', 'Гортензия', 'Гертруда', 'Джейн', 'Жаклин']
var WitchFamilieName=['Щурая', 'Сероглазая', 'Сквернословная', 'Одержимая', 'Провидица', 'Памятливая', 'Неотразимая', 'Большерукая', 'Дряхлая', 'Нерешительная', 'Дурная', 'Забывчивая']

#Shop logic
var Coin=90000
var ShopItems={
	'GoatHead': {
		'Name': 'Черный агнец',
		'Tir': 4,
		'Type': 'GoatHead',
		'Description': 'Мощный греховный ингредиент. Значительно влияет на карму',
		'Price': 100,
		'Texture': preload('res://Sprites/Ingridients/black_lamb.png'),
		'Sin': -9,
		'Ammount': 0
	},

	'Indulgence': {
		'Name': 'Индульгенция',
		'Tir': 4,
		'Type': 'Indulgence',
		'Description': 'Мощный святой ингредиент. Значительно влияет на карму',
		'Price': 100,
		'Texture': preload('res://Sprites/Ingridients/indulgence.png'),
		'Sin': 9,
		'Ammount': 0
	},

	'GlowWorm': {
		'Name': 'Светлячок',
		'Tir': 1,
		'Type': 'GlowWorm',
		'Description': 'Летает как говно',
		'Price': 0,
		'Texture': preload("res://Sprites/Ingridients/glowworm.png"),
		'Sin': 1,
		'Ammount': -1
	},

	'Rat': {
		'Name': 'Крысиный хвост',
		'Tir': 1,
		'Type': 'Rat',
		'Description': 'Нашёл на полу',
		'Price': 0,
		'Texture': preload("res://Sprites/Ingridients/rat_tail.png"),
		'Sin': -1,
		'Ammount': -1
	},

	'Clover': {
		'Name': 'Клевер',
		'Tir': 1,
		'Type': 'Clover',
		'Description': '4хлистный',
		'Price': 0,
		'Texture': preload("res://Sprites/Ingridients/clover.png"),
		'Sin': 2,
		'Ammount': -1
	},

	'Slug': {
		'Name': 'Слизень',
		'Tir': 1,
		'Type': 'Slug',
		'Description': 'Мерзкий как твоя бывшая',
		'Price': 0,
		'Texture': preload("res://Sprites/Ingridients/slug.png"),
		'Sin': -2,
		'Ammount': -1
	},

	'Butterfly': {
		'Name': 'Бабочка',
		'Tir': 1,
		'Type': 'Butterfly',
		'Description': 'Крылатая дрочь',
		'Price': 0,
		'Texture': preload('res://Sprites/Ingridients/butterfly_wing.png'),
		'Sin': 3,
		'Ammount': -1
	},

	'Toad': {
		'Name': 'Лягушка',
		'Tir': 1,
		'Type': 'Toad',
		'Description': 'Воняет и квакает',
		'Price': 0,
		'Texture': preload('res://Sprites/Ingridients/toad.png'),
		'Sin': -3,
		'Ammount': -1
	},

	'Hair': {
		'Name': 'Волосы',
		'Tir': 2,
		'Type': 'Hair',
		'Description': 'С мадамки из трактира',
		'Price': 0,
		'Texture': preload('res://Sprites/Ingridients/hair_curl.png'),
		'Sin': 4,
		'Ammount': 0
	},

	'Spider': {
		'Name': 'Паук',
		'Tir': 2,
		'Type': 'Spider',
		'Description': 'Паук, например',
		'Price': 0,
		'Texture': preload('res://Sprites/Ingridients/spider.png'),
		'Sin': -4,
		'Ammount': 0
	},

	'Rabbit': {
		'Name': 'Кроличья лапка',
		'Tir': 2,
		'Type': 'Rabbit',
		'Description': 'Бедный кроль...',
		'Price': 0,
		'Texture': preload('res://Sprites/Ingridients/rabbit_foot.png'),
		'Sin': 5,
		'Ammount': 0
	},

	'BatWing': {
		'Name': 'Крыло летучей мыши',
		'Tir': 2,
		'Type': 'BatWing',
		'Description': 'Крыло твари',
		'Price': 0,
		'Texture': preload('res://Sprites/Ingridients/bat_wing.png'),
		'Sin': -5,
		'Ammount': 0
	},
	
	'Beads': {
		'Name': 'чОтки',
		'Tir': 2,
		'Type': 'Beads',
		'Description': 'чОткие чОтки',
		'Price': 0,
		'Texture': preload('res://Sprites/Ingridients/beads.png'),
		'Sin': 6,
		'Ammount': 0
	},

	'ToadStool': {
		'Name': 'Поганка',
		'Tir': 2,
		'Type': 'ToadStool',
		'Description': 'Нашёл в лесу',
		'Price': 0,
		'Texture': preload('res://Sprites/Ingridients/toadstool.png'),
		'Sin': -6,
		'Ammount': 0
	},

	'Unihorn': {
		'Name': 'ЕдиноРог',
		'Tir': 3,
		'Type': 'Unihorn',
		'Description': 'Такой же миф как твоя личная жизнь',
		'Price': 0,
		'Texture': preload('res://Sprites/Ingridients/unicorn_horn.png'),
		'Sin': 7,
		'Ammount': 0
	},

	'Finger': {
		'Name': 'Палец ведьмы',
		'Tir': 3,
		'Type': 'Finger',
		'Description': 'Палец той суки',
		'Price': 0,
		'Texture': preload('res://Sprites/Ingridients/witch_finger.png'),
		'Sin': -7,
		'Ammount': 0
	},

	'Fang': {
		'Name': 'Коготь оборотня',
		'Tir': 3,
		'Type': 'Fang',
		'Description': 'Коготь. Ты чо?! Коготь же!',
		'Price': 0,
		'Texture': preload('res://Sprites/Ingridients/werewolf_fang.png'),
		'Sin': -8,
		'Ammount': 0
	},

	'Pandora': {
		'Name': 'Ящик Пандоры',
		'Tir': 0,
		'Type': 'Pandora',
		'Description': 'Дает 3 случайных ингредиента',
		'Price': 200,
		'Texture': preload('res://Sprites/Ingridients/werewolf_fang.png'),
		'Sin': 0,
		'Ammount': 0
	}
}

#Coven logic
var Coven
func CovenStructure():
	Coven = { 
		"Dog": {
			'Name': 'Сторожевой пес',
			'Description': 'Крестьяне платят больше монет',
			'Price': 500,
			'CurrentLevel': '+'+str(CoinBoost)+'%',
			'NextLevel': '+10%',
			'IsBuild': false,
			'Animation': 'Dog',
			'Effect': DogBoost(),
			'Level': 0
		},

		"WitchHaus": {
			'Name': 'Дом ведьмы',
			'Description': 'Увеличивает шкалу кармы ведьмы',
			'Price': 400,
			'CurrentLevel': '+'+str(CoinBoost)+' значение',
			'NextLevel': '+1 значение',
			'IsBuild': true,
			'Animation': 'WitchHaus',
			'Effect': WHausBoost(),
			'Level': 1
		},

		"Graveyard": {
			'Name': 'Кладбище',
			'Description': 'Увеличивает прирост маны от касания шар',
			'Price': 500,
			'CurrentLevel': '+'+str(ManaBoost)+' единица маны',
			'NextLevel': '+1 единица маны',
			'IsBuild': false,
			'Animation': 'Graveyard',
			'Effect': GraveBoost(),
			'Level': 0
		},

		"Isgorod": {
			'Name': 'Живая изгородь',
			'Description': 'Посетители дольше остаются в доме',
			'Price': 600,
			'CurrentLevel': '+'+str(TimerBoost)+' сек',
			'NextLevel': '+1 сек',
			'IsBuild': false,
			'Animation': 'Isgorod',
			'Effect': IsgorodBoost(),
			'Level': 0
		},

		"StoneH": {
			'Name': 'Стоунхендж',
			'Description': 'Увеличивает объем маны',
			'Price': 600,
			'CurrentLevel': '+'+str(ManaMaxBoost)+' единиц',
			'NextLevel': '+5 единиц к максимальному объёму маны',
			'IsBuild': false,
			'Animation': 'StoneH',
			'Effect': StoneBoost(),
			'Level': 0
		},

	#Need to rewrite
		"WitchAss": {
			'Name': 'Домик ученицы ведьмы',
			'Description': 'Шанс получить ингредиент II или III уровня, когда заходит посетитель',
			'Price': 600,
			'CurrentLevel': '+'+str(ManaMaxBoost)+' единиц',
			'NextLevel': '+5 единиц к максимальному объёму маны',
			'IsBuild': false,
			'Animation': 'WitchAss',
			'Effect': DogBoost(),
			'Level': 0
		},

		"Garden": {
			'Name': 'Сад трав',
			'Description': 'Дает пассивный приход монет',
			'Price': 700,
			'CurrentLevel': '+'+str(PassiveCoinBoost)+' монет',
			'NextLevel': '+5 монет',
			'IsBuild': false,
			'Animation': 'Garden',
			'Effect': GardenBoost(),
			'Level': 0
		},

		"FairyTree": {
			'Name': 'Древо фей',
			'Description': 'Постепенно восстанавливает ману',
			'Price': 700,
			'CurrentLevel': '+'+str(ManaRestoreBoost)+' единицы маны',
			'NextLevel': '+1 единица маны раз в 10 секунд',
			'IsBuild': false,
			'Animation': 'FairyTree',
			'Effect': FairyBoost(),
			'Level': 0
		},

		"Chest": {
			'Name': 'Сундук под горой',
			'Description': 'Сохраняет часть денег после смерти ведьмы',
			'Price': 700,
			'CurrentLevel': str(CoinSaveBoost)+'%',
			'NextLevel': '+1%',
			'IsBuild': false,
			'Animation': 'Chest',
			'Effect': ChestBoost(),
			'Level': 0
		},

		"Pot": {
			'Name': 'Котел бесов',
			'Description': 'Увеличивает множитель монет от негативных эффектов паров',
			'Price': 800,
			'CurrentLevel': '+'+str(ManaRestoreBoost)+' единицы маны',
			'NextLevel': '+1 единица маны раз в 10 секунд',
			'IsBuild': false,
			'Animation': 'Pot',
			'Effect': DogBoost(),
			'Level': 0
		},

		"Trap": {
			'Name': 'Ловушка для бесов',
			'Description': 'Может спасти ведьму от бесов',
			'Price': 800,
			'CurrentLevel': '+'+str(DevilSaveBoost)+'%',
			'NextLevel': '+1%',
			'IsBuild': false,
			'Animation': 'Trap',
			'Effect': TrapBoost(),
			'Level': 0
		},

		"Mashroom": {
			'Name': 'Грибная поляна',
			'Description': 'Может спасти ведьму от крестьян',
			'Price': 800,
			'CurrentLevel': '+'+str(PeasantSaveChance)+'%',
			'NextLevel': '+1%',
			'IsBuild': false,
			'Animation': 'Mashroom',
			'Effect': MashroomBoost(),
			'Level': 0
		},
	}

#Haus variables
var CoinBoost=0
func DogBoost():
	CoinBoost+=0.1

var KarmaBoost=0
func WHausBoost():
	KarmaBoost+=2

var ManaBoost=0
func GraveBoost():
	ManaBoost+=1

var TimerBoost=0
func IsgorodBoost():
	TimerBoost+=1

var ManaMaxBoost=0
func StoneBoost():
	ManaMaxBoost+=5

var PassiveCoinBoost=0
func GardenBoost():
	PassiveCoinBoost+=1

var ManaRestoreBoost=0
func FairyBoost():
	ManaRestoreBoost+=1

var CoinSaveBoost=0
func ChestBoost():
	CoinSaveBoost+=1

var DevilSaveBoost=0
func TrapBoost():
	DevilSaveBoost+=1

var PeasantSaveChance=0
func MashroomBoost():
	PeasantSaveChance+=1

#Event logic
func event_creator():
	return {
		0 : 
			{
			"Animation" : "Witch",
			"Question" : "Эй, неумеха! За окном опять прошел дождь из жаб. Помоги мне убраться!",
			"Is Answer" : false,
			"PositiveEffect" : "плюс мана, жабы вместо ингредиентов на столе, жабы в два раза сильнее",
			"NegativeEffect" : "минус 20 кармы, минус 30 маны"
			}, 

		1 : 
			{
			"Animation" : "Witch",
			"Question" : "Моргана Медленная опять превратила себя в слизня. У тебя есть соль?",
			"Is Answer" : false,
			"PositiveEffect" : "минус 20 кармы, слизни в два раза слабее",
			"NegativeEffect" : "плюс 20 кармы, слизни в два раза сильнее" 
			},

		2 : 
			{
			"Animation" : "Inquisitor",
			"Question" : "Ты случайно не видела здесь ведьм? Я иду по их следу...", 
			"Is Answer" : false,
			"PositiveEffect" : "плюс 20 кармы",
			"NegativeEffect" : "минус 20 кармы"
			},

		3 : 
			{
			"Animation" : "Inquisitor",
			"Question" : "Я заплутал в лесу и набрел на вашу хижину. Не найдется ли воды для усталого путника?",
			"Is Answer" : false,
			"PositiveEffect" : "плюс 20 кармы, следующий ингредиент - четки",
			"NegativeEffect" : "минус 20 кармы"
			},
	}

func GameStart():
	return {
		"Animation" : "Devil",
		"Question" : "Эти монеты заработала твоя предшественница? Нет ведьмы - нет договора. Я заберу их!",
		"Is Answer" : false,
		"PositiveEffect" : "плюс 20 кармы, следующий ингредиент - четки",
		"NegativeEffect" : "минус 20 кармы"
	}

func DevilCat():
	return {
		0: 
			{
				"Animation" : "Devil",
				"Question" : "Я охотился в погребе и поймал крысу. Показать?",
				"Is Answer" : false,
				"PositiveEffect" : "крысиные хвосты вместо ингредиентов на столе",
				"NegativeEffect" : "плюс 20 кармы, минус 30 маны"
			},
		1: 
			{
				"Animation" : "Devil",
				"Question" : "Время - деньги, ведь так?",
				"Is Answer" : false,
				"PositiveEffect" : "крысиные хвосты вместо ингредиентов на столе",
				"NegativeEffect" : "плюс 20 кармы, минус 30 маны"
			},

		2: 
			{
				"Animation" : "Devil",
				"Question" : "Время - деньги, ведь так?",
				"Is Answer" : false,
				"PositiveEffect" : "Гляжу, ты неплохо освоилась на новом месте?",
				"NegativeEffect" : "плюс 20 кармы, минус 30 маны"
			},
	}

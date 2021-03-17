extends Node2D

#func to hide all trinkets
func HideAllTrinkets():
	for trinket in get_children():
		trinket.hide()
	$Neck.show()
	$Body.show()
	$Head.show()
	$Nose.show()
	$Eye.show()
	$Ears.show()
	$Mouth.show()
	
#sin level creator
func FrameNumbers(Neck, Body, Head, Nose, Eye, Ears, Mouth):
	$Neck.set_frame(Neck)
	$Body.set_frame(Body)
	$Head.set_frame(Head)
	$Nose.set_frame(Nose)
	$Eye.set_frame(Eye)
	$Ears.set_frame(Ears)
	$Mouth.set_frame(Mouth)

func Lvl1():
	FrameNumbers(1, 0, 1, 2, 1, 1, 2)

	$Aura.show()
	$Teeths.show()
	$Horns.show()
	$FaceAddition.show()
	$FaceHair.show()

func Lvl2():
	FrameNumbers(1, 0, 1, 2, 1, 1, 2)

	$Aura.show()
	$Teeths.show()
	$Horns.show()
	$FaceAddition.show()

func Lvl3():
	FrameNumbers(1, 0, 1, 2, 1, 1, 2)

	$Aura.show()
	$Teeths.show()
	$FaceAddition.show()

func Lvl4():
	FrameNumbers(1, 0, 1, 1, 1, 1, 2)

	$Aura.show()
	$Teeths.show()
	$FaceAddition.show()

func Lvl5():
	FrameNumbers(0, 0, 0, 0, 1, 0, 2)

	$Aura.show()
	$Teeths.show()
	$FaceAddition.show()

func Lvl6():
	FrameNumbers(0, 0, 0, 0, 1, 0, 2)

	$Aura.show()
	$FaceAddition.show()

func Lvl7():
	FrameNumbers(0, 0, 0, 0, 1, 0, 2)

	$Aura.show()

func Lvl8():
	FrameNumbers(0, 0, 0, 0, 0, 0, 2)

	$Aura.show()

func Lvl9():
	FrameNumbers(0, 0, 0, 0, 0, 0, 2)

func Lvl10():
	FrameNumbers(0, 0, 0, 0, 0, 0, 0)

func Lvl11():
	FrameNumbers(0, 0, 0, 0, 0, 0, 0)

func Lvl12():
	FrameNumbers(0, 0, 0, 0, 0, 0, 1)

func Lvl13():
	FrameNumbers(0, 1, 0, 0, 2, 0, 1)

func Lvl14():
	FrameNumbers(0, 1, 0, 0, 2, 0, 1)

	$Hat.show()

func Lvl15():
	FrameNumbers(0, 1, 0, 0, 2, 0, 1)

	$Hat.show()
	$NeckTrinket.show()

func Lvl16():
	FrameNumbers(0, 1, 0, 0, 2, 0, 1)

	$Hat.show()
	$NeckTrinket.show()
	$BodyTrinket.show()

func Lvl17():
	FrameNumbers(0, 1, 0, 0, 2, 0, 1)

	$Hat.show()
	$NeckTrinket.show()
	$BodyTrinket.show()
	$Cross.show()

func Lvl18():
	FrameNumbers(0, 1, 0, 0, 2, 0, 1)

	$Hat.show()
	$NeckTrinket.show()
	$BodyTrinket.show()
	$Cross.show()
	$Paper.show()

func Lvl19():
	FrameNumbers(0, 1, 0, 0, 2, 0, 1)

	$Hat.show()
	$NeckTrinket.show()
	$BodyTrinket.show()
	$Cross.show()
	$Nimb.show()
	$Paper.show()

func Lvl20():
	FrameNumbers(0, 1, 0, 0, 2, 0, 1)

	$Wings.show()
	$Hat.show()
	$NeckTrinket.show()
	$BodyTrinket.show()
	$Cross.show()
	$Nimb.show()
	$Paper.show()

#Peasant transformer
func ChangeParts(PeasantSin):
	HideAllTrinkets()
	match PeasantSin:
		1:
			Lvl1()
		2:
			Lvl2()
		3:
			Lvl3()
		4:
			Lvl4()
		5:
			Lvl5()
		6:
			Lvl6()
		7:
			Lvl7()
		8:
			Lvl8()
		9:
			Lvl9()
		10:
			Lvl10()
		11:
			Lvl11()
		12:
			Lvl12()
		13:
			Lvl13()
		14:
			Lvl14()
		15:
			Lvl15()
		16:
			Lvl16()
		17:
			Lvl17()
		18:
			Lvl18()
		19:
			Lvl19()
		20:
			Lvl20()

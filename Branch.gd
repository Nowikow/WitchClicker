extends TextureButton

var WitchIndex

func _ready():
	CreateAWitch()

	yield(get_tree().create_timer(.5), "timeout")
	$Fader/AnimationPlayerIn.play("Appear")

func CreateAWitch():
	if WitchIndex>Global.Witches.size():
		randomize()
		Global.Witches.append([randi()%6, randi()%6, randi()%6, randi()%6, randi()%6, randi()%6, randi()%6, Global.WitchNames[randi()%Global.WitchNames.size()]+' '+Global.WitchFamilieName[randi()%Global.WitchFamilieName.size()]])

	WitchConstructor(Global.Witches[WitchIndex-1][0], Global.Witches[WitchIndex-1][1], Global.Witches[WitchIndex-1][2], Global.Witches[WitchIndex-1][3], Global.Witches[WitchIndex-1][4], Global.Witches[WitchIndex-1][5], Global.Witches[WitchIndex-1][6])
	$Text/TextLabel.text=Global.Witches[WitchIndex-1][7]

func WitchConstructor(BodyFrame, FaceFrame, HairFrame, HatFrame, EyesFrame, NoseFrame, MundFrame):
	$FrameBg/WitchConstructor/Body.set_frame(BodyFrame)
	$FrameBg/WitchConstructor/Face.set_frame(FaceFrame)
	$FrameBg/WitchConstructor/Hair.set_frame(HairFrame)
	$FrameBg/WitchConstructor/Hat.set_frame(HatFrame)
	$FrameBg/WitchConstructor/Eyes.set_frame(EyesFrame)
	$FrameBg/WitchConstructor/Nose.set_frame(NoseFrame)
	$FrameBg/WitchConstructor/Mund.set_frame(MundFrame)

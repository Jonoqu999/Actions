extends Node


# Called when the node enters the scene tree for the first time.
func _ready():
	$Accoins/Accoins.text = str(GlobalVariables.Accoins)
	Ein_show()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	$Pic/lvl.text = "Pic lvl: " + str(GlobalVariables.pic_lvl)
	$Axe/lvl.text = "Axe lvl: " + str(GlobalVariables.axe_lvl)
	$Accoins/Accoins.text = str(GlobalVariables.Accoins)

func _on_exit_pressed():
	get_tree().change_scene_to_file(GlobalVariables.previous_sceen)

func Ein_show():
	Ein_hide()
	if GlobalVariables.pic_lvl > 0:
		$Pic.show()
	if GlobalVariables.axe_lvl > 0:
		$Axe.show()
		
func Ein_hide():
	$Pic.hide()
	$Axe.hide()


func _on_ein_pressed():
	get_tree().change_scene_to_file("res://Inv.tscn")

extends Node


# Called when the node enters the scene tree for the first time.
func _ready():
	$Accoins/Accoins.text = str(GlobalVariables.Accoins)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	$Accoins/Accoins.text = str(GlobalVariables.Accoins)
	$Pic/pice.text = "Accoins: " + str(_get_price(1.75*GlobalVariables.pic_lvl,100))
	$Axe/pice.text = "Accoins: " + str(_get_price(1.85*GlobalVariables.axe_lvl,1000))
	$Pic/lvl.text = "lvl: " + str(GlobalVariables.pic_lvl)
	$Axe/lvl.text = "lvl: " + str(GlobalVariables.axe_lvl)


func _on_pic_upgrade_pressed():
	if GlobalVariables.Accoins >= _get_price(1.75*GlobalVariables.pic_lvl,100):
		GlobalVariables.Accoins -= _get_price(1.75*GlobalVariables.pic_lvl,100)
		GlobalVariables.pic_lvl += 1


func _on_axe_upgrade_pressed():
	if GlobalVariables.Accoins >= _get_price(1.85*GlobalVariables.axe_lvl,1000):
		GlobalVariables.Accoins -= _get_price(1.85*GlobalVariables.axe_lvl,1000)
		GlobalVariables.axe_lvl += 1

func _get_price(t,v):
	var val = v * t
	if val == 0:
		val = v
	return val

func _on_exit_pressed():
	get_tree().change_scene_to_file("res://Mercat/mercat.tscn")

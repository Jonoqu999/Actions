extends Node


# Called when the node enters the scene tree for the first time.
func _ready():
	$Accoins/Accoins.text = str(GlobalVariables.Accoins)
	_on_inv_show()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	$pedra.text = "pedra: " + str(GlobalVariables.pedra[0])
	$ferro.text = "Ferros: " + str(GlobalVariables.ferro[0])
	$or.text = "Or: " + str(GlobalVariables.gold[0])
	$maragda.text = "Maragdes: " + str(GlobalVariables.maragda[0])
	$diamant.text = "Diamants: " + str(GlobalVariables.diamant[0])
	$fusta.text = "Fusta: " + str(GlobalVariables.fusta[0])
	$Accoins/Accoins.text = str(GlobalVariables.Accoins)

func _on_mine_hide():	
	$pedra.hide()
	$ferro.hide()
	$or.hide()
	$maragda.hide()
	$diamant.hide()
	$Accoins.hide()
	$fusta.hide()

func _on_inv_show():
	_on_mine_hide()
	if GlobalVariables.pedra[1]:
		$pedra.show()
	if GlobalVariables.ferro[1]:
		$ferro.show()
	if GlobalVariables.gold[1]:
		$or.show()
	if GlobalVariables.maragda[1]:
		$maragda.show()
	if GlobalVariables.diamant[1]:
		$diamant.show()
	if GlobalVariables.fusta[0]:
		$fusta.show()
	$Accoins.show()


func _on_exit_pressed():
	get_tree().change_scene_to_file(GlobalVariables.previous_sceen)


func _on_eines_pressed():
	get_tree().change_scene_to_file("res://ein_inv.tscn")

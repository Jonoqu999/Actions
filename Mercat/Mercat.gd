extends Node
var ten = {Pedra=15,Ferro=5,Or=3}
var ein = {Pedra=50,Ferro=15,Or=10}

# Called when the node enters the scene tree for the first time.
func _ready():
	if GlobalVariables.poble.mat:
		$RepMat.hide()
		$Mat.disabled = false
	else:
		$RepMat.show()
		$Mat.disabled = true
	if GlobalVariables.poble.ein:
		$RepEin.hide()
		$Ein.disabled = false
	else:
		$RepEin.show()
		$Ein.disabled = true
	if GlobalVariables.poble.en:
		$En.disabled = false
	else:
		$En.disabled = true
	$Accoins/Accoins.text = str(GlobalVariables.Accoins)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	$Accoins/Accoins.text = str(GlobalVariables.Accoins)


func _on_mat_pressed():
	get_tree().change_scene_to_file("res://Mercat/Materials.tscn")


func _on_ein_pressed():
	get_tree().change_scene_to_file("res://Mercat/eines.tscn")


func _on_exit_pressed():
	get_tree().change_scene_to_file("res://node_2d.tscn")


func _on_r_mat_pressed():
	if GlobalVariables.pedra[0] >= ten.Pedra && GlobalVariables.ferro[0] >= ten.Ferro && GlobalVariables.gold[0] >= ten.Or:
		GlobalVariables.pedra[0] -= ten.Pedra
		GlobalVariables.ferro[0] -= ten.Ferro
		GlobalVariables.gold[0] -= ten.Or
		$RepMat.hide()
		$Mat.disabled = false
		GlobalVariables.poble.mat = true


func _on_r_ein_pressed():
		if GlobalVariables.pedra[0] >= ein.Pedra && GlobalVariables.ferro[0] >= ein.Ferro && GlobalVariables.gold[0] >= ein.Or:
			GlobalVariables.pedra[0] -= ein.Pedra
			GlobalVariables.ferro[0] -= ein.Ferro
			GlobalVariables.gold[0] -= ein.Or
			$RepEin.hide()
			$Ein.disabled = false
			GlobalVariables.poble.ein = true

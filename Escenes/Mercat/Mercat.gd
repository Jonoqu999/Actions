extends Node
var ten = {Pedra=15,Ferro=5,Or=3}
var ein = {Pedra=20,Ferro=10,Or=5}
var preu_casa = {Pedra = 50, Ferro = 10, Fusta = 20}

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
	$Cases.text = "Cases: " + str(GlobalVariables.cases)
	$Accoins/Accoins.text = str(GlobalVariables.Accoins)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	$Accoins/Accoins.text = str(GlobalVariables.Accoins)


func _on_mat_pressed():
	get_tree().change_scene_to_file("res://Escenes/Mercat/Materials.tscn")


func _on_ein_pressed():
	get_tree().change_scene_to_file("res://Escenes/Mercat/Eines.tscn")


func _on_exit_pressed():
	get_tree().change_scene_to_file("res://Escenes/Menú/Menú.tscn")


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


func _on_en_pressed():
	if _pot_permetre_casa():
		GlobalVariables.cases += 1
		$Cases.text = "Cases: "+ str(GlobalVariables.cases)
		$Timer.start()
		$NovaCasa.show()

func _pot_permetre_casa() -> bool:
	if GlobalVariables.cases < 5:
		print("Pedra ", GlobalVariables.pedra[0] >= preu_casa.Pedra*_modificador_cases())
		print("Ferro ", GlobalVariables.ferro[0] >= preu_casa.Ferro*_modificador_cases())
		print("Fusta ", GlobalVariables.fusta[0] >= preu_casa.Fusta*_modificador_cases())
		if GlobalVariables.pedra[0] >= preu_casa.Pedra*_modificador_cases() and GlobalVariables.ferro[0] >= preu_casa.Pedra*_modificador_cases() and GlobalVariables.fusta[0] >= preu_casa.Fusta*_modificador_cases():
			GlobalVariables.pedra[0] -= preu_casa.Pedra*_modificador_cases()
			GlobalVariables.ferro[0] -= preu_casa.Ferro*_modificador_cases()
			GlobalVariables.fusta[0] -= preu_casa.Fusta*_modificador_cases()
			return true
		else:
			return false
	else:
		return false

func _modificador_cases() -> int:
	return int(max(1,1.2*GlobalVariables.cases-1))


func _on_timer_timeout():
	$NovaCasa.hide()


func _on_inv_pressed():
	GlobalVariables.previous_sceen = "res://Escenes/Mercat/Mercat.tscn"
	get_tree().change_scene_to_file("res://Escenes/Inventari/Materials.tscn")

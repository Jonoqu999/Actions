extends Popup

# Called when the node enters the scene tree for the first time.
func _ready():
	$Timer.stop()
	$TabContainer/Compte/MarginContainer/GridContainer/User.text = GlobalVariables.user
	$TabContainer/Compte/MarginContainer/GridContainer/Pass.text = GlobalVariables.passw


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass


func _on_save_pressed():
	var path = "res://Users/"+str($TabContainer/Compte/MarginContainer/GridContainer/User.text)+".data"
	var passw = FileAccess.open(path,FileAccess.READ)
	if passw:
		var con = JSON.parse_string(passw.get_line())
		if con.password == str($TabContainer/Compte/MarginContainer/GridContainer/Pass.text):
			passw.close()
			var file = FileAccess.open(path,FileAccess.WRITE)
			var inv : Dictionary = {
				pedra = GlobalVariables.pedra,
				ferro = GlobalVariables.ferro,
				gold = GlobalVariables.gold,
				maragda = GlobalVariables.maragda,
				diamant = GlobalVariables.diamant,
				accoins = GlobalVariables.Accoins,
				pic_lvl = GlobalVariables.pic_lvl,
				axe_lvl = GlobalVariables.axe_lvl,
				poble = GlobalVariables.poble,
				password = $TabContainer/Compte/MarginContainer/GridContainer/Pass.text}
			var data = JSON.stringify(inv)
			file.store_line(data)
			file.close()
			_alert("Guardat")
		else:
			passw.close()
			_alert("Usuari ja exsistent o contrasenya incorrecta")
	else:
		var file = FileAccess.open(path,FileAccess.WRITE)
		var inv : Dictionary = {
			pedra = GlobalVariables.pedra,
			ferro = GlobalVariables.ferro,
			gold = GlobalVariables.gold,
			maragda = GlobalVariables.maragda,
			diamant = GlobalVariables.diamant,
			accoins = GlobalVariables.Accoins,
			pic_lvl = GlobalVariables.pic_lvl,
			axe_lvl = GlobalVariables.axe_lvl,
			poble = GlobalVariables.poble,
			password = $TabContainer/Compte/MarginContainer/GridContainer/Pass.text}
		var data = JSON.stringify(inv)
		file.store_line(data)
		file.close()
		_alert("Nou usuari i guardat")

func _on_load_pressed():
	var path = "res://Users/"+str($TabContainer/Compte/MarginContainer/GridContainer/User.text)+".data"
	var passw = FileAccess.open(path,FileAccess.READ)
	if passw:
		var con = JSON.parse_string(passw.get_line()).password
		if con == $TabContainer/Compte/MarginContainer/GridContainer/Pass.text:
			passw.close()
			var file = FileAccess.open(path,FileAccess.READ)
			var inv = JSON.parse_string(file.get_line())
			if inv.has("pedra"):
				GlobalVariables.pedra = inv.pedra
			else:
				GlobalVariables.pedra = [0,false]
			if inv.has("ferro"):
				GlobalVariables.ferro = inv.ferro
			else:
				GlobalVariables.ferro = [0,false]
			if inv.has("gold"):
				GlobalVariables.gold = inv.gold
			else:
				GlobalVariables.gold = [0,false]
			if inv.has("maragda"):
				GlobalVariables.maragda = inv.maragda
			else:
				GlobalVariables.maragda = [0,false]
			if inv.has("diamant"):
				GlobalVariables.diamant = inv.diamant
			else:
				GlobalVariables.diamant = [0,false]
			if inv.has("accoins"):
				GlobalVariables.Accoins = inv.accoins
			else:
				GlobalVariables.diamant = [0,false]
			if inv.has("pic_lvl"):
				GlobalVariables.pic_lvl = inv.pic_lvl
			else:
				GlobalVariables.pic_lvl = 1
			if inv.has("axe_lvl"):
				GlobalVariables.axe_lvl = inv.axe_lvl
			else:
				GlobalVariables.axe_lvl = 0
			if inv.has("poble"):
				GlobalVariables.poble = inv.poble
			else:
				GlobalVariables.poble = {mat=false, ein=false, en=false}
			_alert("Carregat")
		else:
			_alert("Contrasenya incorrecta")
	else:
		_alert("Usuari inexsistent")

func _alert(strr):
	$TabContainer/Compte/MarginContainer/GridContainer/Alert.text = strr
	$TabContainer/Compte/MarginContainer/GridContainer/Alert.show()
	$Timer.start()

func _on_timer_timeout():
	$TabContainer/Compte/MarginContainer/GridContainer/Alert.hide()
	$Timer.stop()

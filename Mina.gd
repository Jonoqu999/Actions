extends Node
var ob_t1 = [{ore = "pedra",Pro = 80},{ore = "ferro",Pro = 14},{ore = "or",Pro = 7}]
var ob_t2 = [{ore = "pedra",Pro = 70},{ore = "ferro",Pro = 15},{ore = "or",Pro = 10},{ore = "maragda",Pro = 6}]
var ob_t3 = [{ore = "pedra",Pro = 60},{ore = "ferro",Pro = 20},{ore = "or",Pro = 14},{ore = "maragda",Pro = 3},{ore = "diamant",Pro = 3}]
var nombre
var mina = true

# Called when the node enters the scene tree for the first time.
func _ready():
	$Rec2.hide()
	$Rec3.hide()
	$T2.disabled = true
	$T3.disabled = true
	if GlobalVariables.pic_lvl >= 2:
		$T2.disabled = false
	if GlobalVariables.pic_lvl >= 3:
		$T3.disabled = false
	if $T2.disabled:
		$Rec2.show()
	if $T3.disabled:
		$Rec3.show()
	$Timer.stop()
	$NTimer.stop()
	$Cooldown.stop()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass


func _on_minar_pressed(obtenibles):
	if mina:
		mina = false
		$Cooldown.start()
		var ran_min = randi_range(0,100)
		for i in obtenibles:
			if ran_min <= i.Pro:
				var ore = i.ore
				if ore == "pedra":
					if !GlobalVariables.pedra[1]:
						GlobalVariables.pedra[1] = true
						$NouMin.text = "Has descobert pedra"
						$NouMin.show()
						$NTimer.start()
					nombre = randi_range(1,5)
					GlobalVariables.pedra[0] += nombre
					$Mineral.show()
					$Mineral.text = "Has obtingut " + str(nombre) + " Pedres"
					$Timer.start()
				elif ore == "ferro":
					if !GlobalVariables.ferro[1]:
						GlobalVariables.ferro[1] = true
						$NouMin.text = "Has descobert ferro"
						$NouMin.show()
						$NTimer.start()
					nombre = randi_range(1,5)
					GlobalVariables.ferro[0] += nombre
					$Mineral.show()
					$Mineral.text = "Has obtingut " + str(nombre) + " de Ferro"
					$Timer.start()
				elif ore == "or":
					if !GlobalVariables.gold[1]:
						GlobalVariables.gold[1] = true
						$NouMin.text = "Has descobert or"
						$NouMin.show()
						$NTimer.start()
					nombre = randi_range(1,4)
					GlobalVariables.gold[0] += nombre
					$Mineral.show()
					$Mineral.text = "Has obtingut " + str(nombre) + " d'Or"
					$Timer.start()
				elif ore == "maragda":
					if !GlobalVariables.maragda[1]:
						GlobalVariables.maragda[1] = true
						$NouMin.text = "Has descobert margda"
						$NouMin.show()
						$NTimer.start()
					nombre = randi_range(1,3)
					GlobalVariables.maragda[0] += nombre
					$Mineral.show()
					$Mineral.text = "Has obtingut " + str(nombre) + " Maragdes"
					$Timer.start()
				elif ore == "diamant":
					if !GlobalVariables.diamant[1]:
						GlobalVariables.diamant[1] = true
						$NouMin.text = "Has descobert diamant"
						$NouMin.show()
						$NTimer.start()
					nombre = randi_range(1,2)
					GlobalVariables.diamant[0] += nombre
					$Mineral.show()
					$Mineral.text = "Has obtingut " + str(nombre) + " Diamants"
					$Timer.start()
				break
			else:
				ran_min -= i.Pro
	else:
		$Mineral.text = "T'has d'esperar"
		$Timer.start()

func _on_main_hide():
	$Minar.hide()
	$Mineral.hide()
	$NouMin.hide()
	$Timer.stop()
	$NTimer.stop()
	$Cooldown.stop()

func _on_timer_timeout():
	$Mineral.hide()


func _on_cooldown_timeout():
	mina = true


func _on_n_timer_timeout():
	$NouMin.hide()


func _on_exit_pressed():
	get_tree().change_scene_to_file("res://node_2d.tscn")


func _on_t_1_pressed():
	_on_minar_pressed(ob_t1)


func _on_t_2_pressed():
	_on_minar_pressed(ob_t2)


func _on_t_3_pressed():
	_on_minar_pressed(ob_t3)

extends Node
var ob_t1 = GlobalVariables.loot_tabel
var MAX_ROCK_HEALTH = GlobalVariables.rock_health
var HEALH_FASE = MAX_ROCK_HEALTH/4.0
var rock_health = MAX_ROCK_HEALTH
var mina = true
var mining = false

@onready var rock = $AnimatedSprite2D 
@onready var bar = $ProgressBar

# Called when the node enters the scene tree for the first time.
func _ready():
	$ProgressBar.max_value = MAX_ROCK_HEALTH


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):	
	# Heals the rock if it is not 
	if rock_health > 0 and mining:
		rock_health += 1*_delta
		rock_health = min(rock_health,MAX_ROCK_HEALTH)
		
		_update()


func _on_texture_button_pressed():
	$LTimer.stop()
	mining = true
	rock_health -= 1 #Loses 1 helth per hit
	rock_health = max(0,rock_health)
	
	if rock_health == 0 and mina:
		mining = false
		$Cooldown.start()
		$LTimer.start()
		_on_minar_pressed(ob_t1)
	
	_update()

func _update(): #Updates the rock and bar satatus
	rock.set_frame_and_progress(abs(ceil(rock_health/float(HEALH_FASE))-4),0.1) #Some fancy math to know the frame
	
	bar.value = rock_health

func _on_minar_pressed(obtenibles):
	var nombre
	if mina:
		mina = false
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
					nombre = _aplicar_mults(randi_range(1,5))
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
					nombre = _aplicar_mults(randi_range(1,5))
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
					nombre = _aplicar_mults(randi_range(1,4))
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
					nombre = _aplicar_mults(randi_range(1,3))
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
					nombre = _aplicar_mults(randi_range(1,2))
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

func _on_exit_pressed():
	get_tree().change_scene_to_file("res://Escenes/Mina/Mina.tscn")

func _aplicar_mults(value):
	value *= max(1,1.1*GlobalVariables.cases)
	value *= max(1,1.5*(GlobalVariables.pic_lvl-1))
	return value


func _on_cooldown_timeout():
	mina = true
	rock_health = MAX_ROCK_HEALTH
	
	$Cooldown.stop()

func _on_timer_timeout():
	$Mineral.hide()

func _on_n_timer_timeout():
	$NouMin.hide()


func _on_l_timer_timeout():
	_update()
	$LTimer.stop()
	mining = true


func _on_inv_pressed():
	GlobalVariables.previous_sceen = "res://Escenes/Mina/Minant.tscn"
	get_tree().change_scene_to_file("res://Escenes/Inventari/Materials.tscn")

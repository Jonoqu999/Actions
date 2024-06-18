extends Node
var valorv = {Pedra=1,Ferro=5,Or=10,Maragda=30,Diamant=50,Fusta=5}
var valorc = {Pedra=2,Ferro=7,Or=15,Maragda=40,Diamant=70,Fusta=7}
var com = false
# Called when the node enters the scene tree for the first time.
func _ready():
	_Tenda_show()
	$Timer.stop()
	$Accoins/Accoins.text = str(GlobalVariables.Accoins)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	$Pedra/Pquan.text = str($Pedra/SPedra.value)
	$Ferro/Fquan.text = str($Ferro/SFerro.value)
	$Or/Oquan.text = str($Or/SOr.value)
	$Maragda/Mquan.text = str($Maragda/SMaragda.value)
	$Diamant/Dquan.text = str($Diamant/SDiamant.value)
	$Fusta/Fquan.text = str($Fusta/SFusta.value)
	if !com:
		$Pedra/SPedra.max_value = GlobalVariables.pedra[0]
		$Ferro/SFerro.max_value = GlobalVariables.ferro[0]
		$Or/SOr.max_value = GlobalVariables.gold[0]
		$Maragda/SMaragda.max_value = GlobalVariables.maragda[0]
		$Diamant/SDiamant.max_value = GlobalVariables.diamant[0]
		$Fusta/SFusta.max_value = GlobalVariables.fusta[0]
		$Pedra/PVenta.text = "Vendre"
		$Ferro/FVenta.text = "Vendre"
		$Or/OVenta.text = "Vendre"
		$Maragda/MVenta.text = "Vendre"
		$Diamant/DVenta.text = "Vendre"
		$Fusta/FVenta.text = "Vendre"
	else:
		$Pedra/SPedra.max_value = 100
		$Ferro/SFerro.max_value = 100
		$Or/SOr.max_value = 100
		$Maragda/SMaragda.max_value = 100
		$Diamant/SDiamant.max_value = 100
		$Fusta/SFusta.max_value = 100
		$Pedra/PVenta.text = "Comprar"
		$Ferro/FVenta.text = "Comprar"
		$Or/OVenta.text = "Comprar"
		$Maragda/MVenta.text = "Comprar"
		$Diamant/DVenta.text = "Comprar"
		$Fusta/FVenta.text = "Comprar"
	$Accoins/Accoins.text = str(GlobalVariables.Accoins)

func _Tenda_hide():
	$Pedra.hide()
	$Ferro.hide()
	$Or.hide()
	$Maragda.hide()
	$Diamant.hide()
	$Accoins.hide()
	$Venta.hide()
	$Fusta.hide()
	$Timer.stop()
	
func _Tenda_show():
	_Tenda_hide()
	if GlobalVariables.pedra[1]:
		$Pedra.show()
	if GlobalVariables.ferro[1]:
		$Ferro.show()
	if GlobalVariables.gold[1]:
		$Or.show()
	if GlobalVariables.maragda[1]:
		$Maragda.show()
	if GlobalVariables.diamant[1]:
		$Diamant.show()
	if GlobalVariables.fusta[1]:
		$Fusta.show()
	$Accoins.show()
	$Pedra/SPedra.value = 0
	$Ferro/SFerro.value = 0
	$Or/SOr.value = 0
	$Maragda/SMaragda.value = 0
	$Diamant/SDiamant.value = 0

func _on_p_venta_pressed():
	if !com:
		GlobalVariables.Accoins += $Pedra/SPedra.value * valorv.Pedra
		GlobalVariables.pedra[0] -= $Pedra/SPedra.value
		$Venta.text = "Has venut " + str($Pedra/SPedra.value) + " de pedra per " + str($Pedra/SPedra.value * valorv.Pedra) + " Accoins"
		$Venta.show()
		$Timer.start()
		$Pedra/SPedra.value = 0
	else:
		if GlobalVariables.Accoins >= $Pedra/SPedra.value * valorc.Pedra:
			GlobalVariables.Accoins -= $Pedra/SPedra.value * valorc.Pedra
			GlobalVariables.pedra[0] += $Pedra/SPedra.value
			$Venta.text = "Has comprat " + str($Pedra/SPedra.value) + " de pedra per " + str($Pedra/SPedra.value * valorc.Pedra) + " Accoins"
			$Venta.show()
			$Timer.start()
		else:
			$Venta.text = "No pots compratr " + str($Pedra/SPedra.value) + " de pedra"
			$Venta.show()
			$Timer.start()

func _on_f_venta_pressed():
	if !com:
		GlobalVariables.Accoins += $Ferro/SFerro.value * valorv.Ferro
		GlobalVariables.ferro[0] -= $Ferro/SFerro.value
		$Venta.text = "Has venut " + str($Ferro/SFerro.value) + " de ferro per " + str($Ferro/SFerro.value * valorv.Ferro) + " Accoins"
		$Venta.show()
		$Timer.start()
		$Ferro/SFerro.value = 0
	else:
		if GlobalVariables.Accoins >= $Ferro/SFerro.value * valorc.Ferro:
			GlobalVariables.Accoins -= $Ferro/SFerro.value * valorc.Ferro
			GlobalVariables.ferro[0] += $Ferro/SFerro.value
			$Venta.text = "Has comprat " + str($Ferro/SFerro.value) + " de ferro per " + str($Ferro/SFerro.value * valorv.Ferro) + " Accoins"
			$Venta.show()
			$Timer.start()
		else:
			$Venta.text = "No pots comprar " + str($Ferro/SFerro.value) + " de pedra"
			$Venta.show()
			$Timer.start()

func _on_o_venta_pressed():
	if !com:
		GlobalVariables.Accoins += $Or/SOr.value * valorv.Or
		GlobalVariables.gold[0] -= $Or/SOr.value
		$Venta.text = "Has venut " + str($Or/SOr.value) + " d'or per " + str($Or/SOr.value * valorv.Or) + " Accoins"
		$Venta.show()
		$Timer.start()
		$Or/SOr.value = 0
	else:
		if GlobalVariables.Accoins >= $Or/SOr.value * valorc.Or:
			GlobalVariables.Accoins -= $Or/SOr.value * valorc.Or
			GlobalVariables.gold[0] += $Or/SOr.value
			$Venta.text = "Has comprat " + str($Or/SOr.value) + " d'or per " + str($Or/SOr.value * valorv.Or) + " Accoins"
			$Venta.show()
			$Timer.start()
		else:
			$Venta.text = "No pots comprar " + str($Or/SOr.value) + " de pedra"
			$Venta.show()
			$Timer.start()


func _on_m_venta_pressed():
	if !com:
		GlobalVariables.Accoins += $Maragda/SMaragda.value * valorv.Maragda
		GlobalVariables.maragda[0] -= $Maragda/SMaragda.value
		$Venta.text = "Has venut " + str($Maragda/SMaragda.value) + " de maragda per " + str($Maragda/SMaragda.value * valorv.Maragda) + " Accoins"
		$Venta.show()
		$Timer.start()
		$Maragda/SMaragda.value = 0
	else:
		if GlobalVariables.Accoins >= $Maragda/SMaragda.value * valorc.Maragda:
			GlobalVariables.Accoins -= $Maragda/SMaragda.value * valorc.Maragda
			GlobalVariables.maragda[0] += $Maragda/SMaragda.value
			$Venta.text = "Has comprat " + str($Maragda/SMaragda.value) + " de maragda per " + str($Maragda/SMaragda.value * valorv.Maragda) + " Accoins"
			$Venta.show()
			$Timer.start()
		else:
			$Venta.text = "No pots comprar " + str($Maragda/SMaragda.value) + " de pedra"
			$Venta.show()
			$Timer.start()


func _on_d_venta_pressed():
	if !com:
		GlobalVariables.Accoins += $Diamant/SDiamant.value * valorv.Diamant
		GlobalVariables.diamant[0] -= $Diamant/SDiamant.value
		$Venta.text = "Has venut " + str($Diamant/SDiamant.value) + " de diamant per " + str($Diamant/SDiamant.value * valorv.Diamant) + " Accoins"
		$Venta.show()
		$Timer.start()
		$Diamant/SDiamant.value = 0
	else:
		if GlobalVariables.Accoins >= $Diamant/SDiamant.value * valorc.Diamant:
			GlobalVariables.Accoins -= $Diamant/SDiamant.value * valorv.Diamant
			GlobalVariables.diamant[0] += $Diamant/SDiamant.value
			$Venta.text = "Has comprat " + str($Diamant/SDiamant.value) + " de diamant per " + str($Diamant/SDiamant.value * valorv.Diamant) + " Accoins"
			$Venta.show()
			$Timer.start()
		else:
			$Venta.text = "No pots comprar " + str($Diamant/SDiamant.value)
			$Venta.show()
			$Timer.start()


func _on_timer_timeout():
	$Venta.hide()
	$Timer.stop()


func _on_exit_pressed():
	get_tree().change_scene_to_file("res://Mercat/mercat.tscn")


func _on_fu_venta_pressed():
	GlobalVariables.Accoins += $Fusta/SFusta.value * valorv.Fusta
	GlobalVariables.diamant[0] -= $Fusta/SFusta.value
	$Venta.text = "Has venut " + str($Pedra/SPedra.value) + " de diamant per " + str($Fusta/SFusta.value * valorv.Fusta) + " Accoins"
	$Venta.show()
	$Timer.start()
	$Fusta/SFusta.value = 0


func _on_check_box_toggled(toggled_on):
	com = toggled_on

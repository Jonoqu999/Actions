extends Node
signal hide
signal minar
signal invenari
signal tenda
signal config

# Called when the node enters the scene tree for the first time.
func _ready():
	hide.emit()
	$Copnfig.hide()
	$Mine_Hover.hide()
	$Bosc_Hover.hide()
	$Poble_Hover.hide()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if GlobalVariables.axe_lvl > 0:
		$Bosc.disabled = false
		$RBosc.hide()
	else:
		$Bosc.disabled = true
		$RBosc.show()

func _main_hide():
	$Inv.hide()
	$TendaButton.hide()
	$ConfigButton.hide()
	$Copnfig.hide()

func _on_mina_pressed():
	get_tree().change_scene_to_file("res://mina.tscn")


func _on_inventari_pressed():
	get_tree().change_scene_to_file("res://Inv.tscn")


func _on_tenda_button_pressed():
	get_tree().change_scene_to_file("res://Mercat/mercat.tscn")


func _on_config_button_pressed():
	$Copnfig.popup()


func _on_bosc_pressed():
	if GlobalVariables.axe_lvl > 0:
		get_tree().change_scene_to_file("res://bosc.tscn")


func _on_texture_button_mouse_entered():
	$Mine_Hover.show()


func _on_texture_button_mouse_exited():
	$Mine_Hover.hide()


func _on_bosc_mouse_entered():
	$Bosc_Hover.show()


func _on_bosc_mouse_exited():
	$Bosc_Hover.hide()


func _on_poble_mouse_entered():
	$Poble_Hover.show()


func _on_poble_mouse_exited():
	$Poble_Hover.hide()

extends Node
signal hide
signal minar
signal invenari
signal tenda
signal config

@onready var poble_hover: TextureRect = $Poble/Poble_Hover
@onready  var bosc_hover: TextureRect = $Bosc/Bosc_Hover
@onready var mine_hover: TextureRect = $Mine/Mine_Hover


# Called when the node enters the scene tree for the first time.
func _ready():
	hide.emit()
	$Copnfig.hide()
	mine_hover.hide()
	bosc_hover.hide()
	poble_hover.hide()

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
	get_tree().change_scene_to_file("res://Escenes/Mina/Mina.tscn")


func _on_inventari_pressed():
	GlobalVariables.previous_sceen = "res://Escenes/Menú/Menú.tscn"
	get_tree().change_scene_to_file("res://Escenes/Inventari/Materials.tscn")


func _on_tenda_button_pressed():
	get_tree().change_scene_to_file("res://Escenes/Mercat/Mercat.tscn")


func _on_config_button_pressed():
	$Copnfig.popup()


func _on_bosc_pressed():
	if GlobalVariables.axe_lvl > 0:
		get_tree().change_scene_to_file("res://Escenes/Bosc/Bosc.tscn")


func _on_texture_button_mouse_entered():
	mine_hover.show()


func _on_texture_button_mouse_exited():
	mine_hover.hide()


func _on_bosc_mouse_entered():
	bosc_hover.show()


func _on_bosc_mouse_exited():
	bosc_hover.hide()


func _on_poble_mouse_entered():
	poble_hover.show()


func _on_poble_mouse_exited():
	poble_hover.hide()

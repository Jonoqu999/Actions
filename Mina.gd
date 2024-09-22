extends Node
var ob_t1 = [{ore = "pedra",Pro = 80},{ore = "ferro",Pro = 14},{ore = "or",Pro = 7}]
var ob_t2 = [{ore = "pedra",Pro = 70},{ore = "ferro",Pro = 15},{ore = "or",Pro = 10},{ore = "maragda",Pro = 6}]
var ob_t3 = [{ore = "pedra",Pro = 60},{ore = "ferro",Pro = 20},{ore = "or",Pro = 14},{ore = "maragda",Pro = 3},{ore = "diamant",Pro = 3}]
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


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func _on_exit_pressed():
	get_tree().change_scene_to_file("res://node_2d.tscn")


func _on_t_1_pressed():
	GlobalVariables.loot_tabel = ob_t1
	GlobalVariables.rock_health = 10
	
	get_tree().change_scene_to_file("res://minant.tscn")


func _on_t_2_pressed():
	GlobalVariables.loot_tabel = ob_t2
	GlobalVariables.rock_health = 20
	
	get_tree().change_scene_to_file("res://minant.tscn")


func _on_t_3_pressed():
	GlobalVariables.loot_tabel = ob_t3
	GlobalVariables.rock_health = 30
	
	get_tree().change_scene_to_file("res://minant.tscn")

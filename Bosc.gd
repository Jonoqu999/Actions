extends Node

var hit_bar_value = 0.77
var hit_bar_dir = 1
var tree_health = 100
var dificulty = 0
var hit_bar_vel = 1+dificulty/4.0
var stunned = false
@onready var pointer = $Hit_bar_pointer
# Called when the node enters the scene tree for the first time.
func _ready():
	$ObTimer.stop()
	$Obt.hide()
	$ProgressBar.max_value = tree_health
	$ProgressBar.value = tree_health


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	hit_bar_value += hit_bar_dir*delta*hit_bar_vel
	#print(hit_bar_value)
	pointer.offset_left = (315*hit_bar_value)-40
	
	if pointer.offset_left >= 275:
		hit_bar_dir = -1
		
		pointer.offset_left = 275
	
	if pointer.offset_left <= -355:
		hit_bar_dir = 1
		
		pointer.offset_left = -355
	
	
func _on_exit_pressed():
	get_tree().change_scene_to_file("res://node_2d.tscn")

func _on_talar_pressed():
	if not stunned:
		if abs(hit_bar_value) <= 0.1:
			_damage_tree(25)
		elif abs(hit_bar_value) <= 0.33:
			_damage_tree(15)
		elif abs(hit_bar_value) <= 0.55:
			_damage_tree(10)
			_stunned(1)
		elif abs(hit_bar_value) <= 0.77:
			_damage_tree(5)
			_stunned(1.5)
		else:
			_damage_tree(0)
			_stunned(3)
	else:
		$StunnedTimer.stop()
		$StunnedTimer.start()

func _alert(str):
	$Obt.show()
	$Obt.text = str
	$ObTimer.start()

func _text(num):
	var txt
	if num == 1:
		txt = "Has obtingt 1 fusta"
	else:
		txt = "Has obtingut " + str(num) + " fustes"
	
	_alert(txt)

func _damage_tree(amount:int):
	tree_health -= amount
	tree_health = max(0,tree_health)
	
	$ProgressBar.value = tree_health
	
	if tree_health == 0:
		var num = randi_range(2*(dificulty*1),10*(dificulty+1))
		_text(num)
		GlobalVariables.fusta[0] += num
		GlobalVariables.fusta[1] = true
		$LTimer.start()
		dificulty = [0,0,0,0,1,1,1,2,2,3][randi_range(0,9)]
		tree_health = 100*(dificulty+1)
		$ProgressBar.max_value = tree_health

func _on_ob_timer_timeout():
	$Obt.hide()
	$ObTimer.stop()


func _on_l_timer_timeout():
	$ProgressBar.value = tree_health
	$LTimer.stop()

func _stunned(sec:int):
	$StunnedTimer.wait_time = sec
	$StunnedTimer.start()
	stunned = true
	$StunnedAlert.visible = true

func _on_stunned_timer_timeout():
	$StunnedAlert.visible = false
	stunned = false

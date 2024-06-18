extends Node

var Cooldown = true
# Called when the node enters the scene tree for the first time.
func _ready():
	$ObTimer.stop()
	$Obt.hide()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_exit_pressed():
	get_tree().change_scene_to_file("res://node_2d.tscn")


func _on_talar_pressed():
	if Cooldown:
		var num = randi_range(0,10)
		_text(num)
		GlobalVariables.fusta[0] += num
		GlobalVariables.fusta[1] = true
		$Cooldown.start()
		Cooldown = false
	else:
		_alert("Has d'esperar "+ str(int($Cooldown.get_time_left())) + " segons")
	

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

func _on_ob_timer_timeout():
	$Obt.hide()
	$ObTimer.stop()


func _on_cooldown_timeout():
	$Cooldown.stop()
	Cooldown = true

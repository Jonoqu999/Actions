extends CharacterBody2D

@onready var _animated = $AnimatedSprite2D



func _on_button_pressed():
	_animated.set_frame_and_progress(2,0.1)

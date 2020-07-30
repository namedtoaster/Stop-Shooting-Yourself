extends MarginContainer

# Called when the node enters the scene tree for the first time.
func _ready():
	print("pause menu")

func _on_Quit_pressed():
	get_tree().quit()


func _on_Resume_pressed():
	togglePause()


func togglePause():
	var new_pause_state = not get_tree().paused
	get_tree().paused = new_pause_state
	visible = new_pause_state
	
	if visible:
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	else:
		Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)

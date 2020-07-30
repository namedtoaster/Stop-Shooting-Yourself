extends MarginContainer

onready var death_label = $MarginContainer/MarginContainer/VBoxContainer/Label

# Called when the node enters the scene tree for the first time.
func _ready():
	print("death")
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)

func _on_Restart_pressed():
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	set_visible(false)
	print("test")
	get_tree().reload_current_scene()
	get_tree().paused = false


func _on_Quit_pressed():
	get_tree().quit()
	
func kill_player():
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	set_visible(true)

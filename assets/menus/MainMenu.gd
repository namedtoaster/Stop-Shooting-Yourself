extends MarginContainer


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	print("main menu")
	Transition.get_child(0).hide()
	# Hide the labels
	Globals.GUI.hide()
	# Show the mouse for the main menu
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


#Transition.change_scene("res://assets/levels/Level0.tscn")


func _on_Exit_pressed():
	get_tree().quit()


func _on_Play_pressed():
	Transition.get_child(0).show()
	Transition.change_scene("res://levels/Level0.tscn")

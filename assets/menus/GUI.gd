extends CanvasLayer

onready var level_label = $MarginContainer/Values/Level/Value

# Called when the node enters the scene tree for the first time.
func _ready():
	print("gui")
	
	level_label.text = str(Globals.level)
	
	# Set to first level when initially loaded
	#$Labels/MarginContainer/VBoxContainer/Level/Value.text = "0"
	
	if get_tree().get_current_scene().get_name() == "End":
		$Labels.hide()
	
func _input(event):
	if event.is_action_pressed("pause"):
		$PauseMenu.togglePause()
	if Input.is_action_just_pressed("fullscreen"):
		OS.window_fullscreen = !OS.window_fullscreen
	
func kill_player():
	Globals.score = 0
	Globals.num_deaths += 1
	
	# Show death message
	$MarginContainer/Death.kill_player()
	
func hide():
	$Labels.hide()

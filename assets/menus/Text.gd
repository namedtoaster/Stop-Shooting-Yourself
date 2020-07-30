# DialogBox.gd
extends Control

# Variables
var page = 0
onready var text = $MarginContainer/Text
onready var player_var = $"../../../Player"

# This whole thing is a mess -- functions all over the place
# But it works. Maybe I can figure out a better way in the future

# Functions
func _ready():
	print("dialog text")
			
	if get_tree().get_current_scene().get_name() != "MainMenu":
		var scene_name = get_tree().get_current_scene().get_name()
		
		if scene_name == "End":
			Globals.level = -1
			
		# Clearly, this part can be done much more efficiently
		# I don't have the time to think about it right now
		
		get_tree().paused = true
		
		if Globals.level == 0:
			if Globals.num_deaths == 0:
				Dialog.dialog = Dialog.intro
			else:
				get_tree().paused = false
				hide()
		elif Globals.level == 1:
			if Globals.num_deaths == 0:
				Dialog.dialog = Dialog.level_1
			else:
				get_tree().paused = false
				hide()
		elif Globals.level == 2:
			if Globals.num_deaths == 0:
				Dialog.dialog = Dialog.level_2
			else:
				get_tree().paused = false
				hide()
		elif Globals.level == 3:
			if Globals.num_deaths == 0:
				Dialog.dialog = Dialog.level_3
			else:
				get_tree().paused = false
				hide()
		elif Globals.level == -1:
			Dialog.dialog = Dialog.end
						
		text.set_bbcode(Dialog.dialog[page])
		text.set_visible_characters(0)
	else:
		get_tree().paused = false
		hide()

func _input(event):
	if Input.is_action_just_pressed("click"):
		if text.get_visible_characters() > text.get_total_character_count():
			if page < Dialog.dialog.size()-1:
				page += 1
				text.set_bbcode(Dialog.dialog[page])
				text.set_visible_characters(0)
		else:
			text.set_visible_characters(text.get_total_character_count())
			
func _process(delta):
#	# Check if the dialog is done so you can start the game
	if is_visible():
		check_dialog()

func _on_Timer_timeout():
	if $DelayStart.is_stopped():
		text.set_visible_characters(text.get_visible_characters()+1)
	
func _on_DelayStart_timeout():
	show()
	$AnimationPlayer.play("fade_in")

func check_dialog():
	if page >= Dialog.dialog.size() - 1:
		set_visible(false)
		get_tree().paused = false
		if get_tree().get_current_scene().get_name() == "End":
			Transition.change_scene("res://assets/menus/MainMenu.tscn")

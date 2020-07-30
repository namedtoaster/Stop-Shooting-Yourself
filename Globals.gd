extends Node

var score = 0
var level = 0
var num_deaths = 0

#onready var GUI  = preload("res://assets/menus/GUI.tscn").instance()

# Called when the node enters the scene tree for the first time.
func _ready():
	print("globals")

func kill_player():
	get_tree().paused = true

func next_level(scene, level_num):
	print("next level")
	
	# Update GUI values
	Globals.level = level_num
	Globals.num_deaths = 0
	Globals.score = 0
	
	# Pause the game so the cinematic can play without interaction
	get_tree().paused = true
	
	# Fade out then in to next scene
	Transition.change_scene(scene)
	
	# Hide the mouse every time a new level is loaded
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)

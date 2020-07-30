extends Area2D

export var scene = "res://levels/Level1.tscn"
export var next_level_num = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	print("gear")

func _on_Gear_body_entered(body):
	print("hit gear")
	Globals.next_level(scene, next_level_num)

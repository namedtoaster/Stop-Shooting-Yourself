extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	print("moving platform")
	var animation = $AnimationPlayer
	var path = $Path2D
	$Label.hide()
	
	var speed = animation.playback_speed
	animation.playback_speed = speed * 243.9 / float(path.curve.get_baked_length())

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

extends Node2D

export (int) var score_padding_length = 8
export (int) var level_padding_length = 1

# Called when the node enters the scene tree for the first time.
func _ready():
	print("labels")
	$MarginContainer/VBoxContainer/Level/Value.set_text(str(Globals.level))
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$MarginContainer/VBoxContainer/Score/Value.text = ("%0*d" % [score_padding_length, Globals.score])

func _on_Bullet_update_score(value):
	Globals.score += 100

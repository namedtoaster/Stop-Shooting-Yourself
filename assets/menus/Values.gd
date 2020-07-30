extends Label

class_name Values

export (int) var paddingLength = 8

var value = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	print("label values")
	update()
	
func reset():
	value = 0
	update()
	
func adjust(adjustment):
	value += adjustment
	update()
	
func update():
	$Value.text = ("%0*d" % [paddingLength, value])


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

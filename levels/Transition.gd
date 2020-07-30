extends CanvasLayer

signal scene_change()

onready var animation_player = $AnimationPlayer
onready var black = $SceneChange/Black

func _ready():
	print("transition")

func change_scene(path, delay = 0.5):
	yield(get_tree().create_timer(delay), "timeout")
	animation_player.play("fade")
	yield(animation_player, "animation_finished")
	assert(get_tree().change_scene(path) == OK)
	animation_player.play_backwards("fade")
	emit_signal("scene_change")

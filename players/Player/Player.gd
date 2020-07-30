extends KinematicBody2D

export (int) var speed = 400
export (int) var jump_speed = -850
export (int) var gravity = 2000
export (bool) var is_dead = false

onready var anim_player = $AnimationPlayer
onready var sprite = $Sprite

var Bullet = preload("res://players/Bullet/Bullet.tscn")

var velocity = Vector2.ZERO
var facing_right = true
var can_slash = true

enum BulletDirection {TOP, LEFT, RIGHT}

# See https://kidscancode.org/godot_recipes/2d/platform_character/
# for sliding movement/acceleration

func _ready():
	print("player")
	# Set the bullet to be invisible so the first one doesn't show up on screen
	# Just a hack for now
	$Bullet.set_visible(false)
	
func get_input():
	velocity.x = 0
	if Input.is_action_pressed("move_right"):
		velocity.x += speed
	if Input.is_action_pressed("move_left"):
		velocity.x -= speed

func _physics_process(delta):
	get_input()
	velocity.y += gravity * delta
	
	var snap = Vector2.DOWN * 8 if is_on_floor() else Vector2.ZERO
	velocity = move_and_slide_with_snap(velocity, snap, Vector2.UP)
	
	if Input.is_action_just_pressed("jump"):
		if is_on_floor():
			velocity.y = jump_speed
	
#	var grounded = is_on_floor()
	
	if facing_right and velocity.x < 0:
		flip()
	if !facing_right and velocity.x > 0:
		flip()
		
	
	if Input.is_action_just_pressed("shoot"):
		call_deferred("_shot_bullet")

func _shot_bullet():
	var pos = ($"Camera2D" as Camera2D).get_camera_screen_center()
	var RandomBulletDirection:int = BulletDirection.values()[ randi()%BulletDirection.size() ]
	
	var bi = Bullet.instance()
	
	# Change the position based on which direction it's coming from
	#enum BulletDirection {TOP, LEFT, RIGHT}
	if RandomBulletDirection == 0:
		bi.position = Vector2(position.x, pos.y - get_viewport_rect().size.y / 2)
		bi.apply_impulse(Vector2(), Vector2(0, bi.projectile_speed))
	elif RandomBulletDirection == 1:
		bi.position = Vector2(pos.x - get_viewport_rect().size.x / 2, position.y)
		bi.apply_impulse(Vector2(), Vector2(bi.projectile_speed, 0))
	elif RandomBulletDirection == 2:
		bi.position = Vector2(pos.x + get_viewport_rect().size.x / 2, position.y)
		bi.apply_impulse(Vector2(), Vector2(-bi.projectile_speed, 0))
	
	get_parent().add_child(bi)


func _on_EnemyDetection_body_entered(body):
	if "Enemy" in body.name:
		Globals.num_deaths += 1
		Globals.kill_player()
		
func flip():
	facing_right = !facing_right
	sprite.flip_h = !sprite.flip_h

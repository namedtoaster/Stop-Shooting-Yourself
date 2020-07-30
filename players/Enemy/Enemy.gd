extends KinematicBody2D

export (int) var speed = 100
export (int) var jump_speed = -850
export (int) var gravity = 2000

onready var sprite = $Sprite

var velocity = Vector2.ZERO
var facing_right = true
var can_slash = true
var direction = 1

func _ready():
	print("enemy")
	
func move():
	velocity.x = 0
	velocity.x = speed * direction
		
func check_floor_or_wall():
	if is_on_wall() or !$RayCast2D.is_colliding():
		$RayCast2D.position *= -1
		direction *= -1

func _physics_process(delta):
	check_floor_or_wall()
	move()
	
	velocity.y += gravity * delta
	
	var snap = Vector2.DOWN * 8 if is_on_floor() else Vector2.ZERO
	velocity = move_and_slide_with_snap(velocity, snap, Vector2.UP)
	
#	var grounded = is_on_floor()
	
	if facing_right and velocity.x < 0:
		flip()
	if !facing_right and velocity.x > 0:
		flip()
		

func flip():
	facing_right = !facing_right
	sprite.flip_h = !sprite.flip_h

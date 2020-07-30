extends RigidBody2D

signal update_score(value)

var projectile_speed = 700
var life_time = 3
var enemy_count = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	print("bullet")
	# Set the collision mask to enemies and players
	#set_collision_mask(3)
	
	# Set to auto self destruct
	SelfDestruct()
	
	# Disable the bullet for the end scene
	if get_tree().get_current_scene().get_name() == "End":
		hide()
	
	
func SelfDestruct():
	yield(get_tree().create_timer(life_time), "timeout")
	queue_free()

func _on_Bullet_body_entered(body):
	if "Player" in body.name:# and get_collision_mask() != 2:
		# Hide the bullet - it will self destruct on its own
		hide()
		
		# Display the death message and reset values
		Globals.kill_player()
		
	if "Enemy" in body.name:
		# Prevent the bullet from hitting the player
		#set_collision_mask_bit(2, false)
		
		# Update the score
		Globals.score += 100
		
		# Delete the enemy
		body.queue_free()
		
		# Hide the bullet
		hide()

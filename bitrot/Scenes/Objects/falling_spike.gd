extends Area2D

@export var fall_speed: float = 400.0
@export var return_speed: float = 1200.0
@export var wait_time: float = 1.0 # Stays at the top for 1 second

var start_position: Vector2
var floor_y: float = 0.0
var is_falling: bool = true
var is_waiting: bool = false

func _ready():
	start_position = position 
	body_entered.connect(_on_body_entered)

func _process(delta):
	# If the timer is ticking at the ceiling, don't move
	if is_waiting:
		return 

	if is_falling:
		# Move DOWN
		position.y += fall_speed * delta
	else:
		# Move UP fast
		position.y -= return_speed * delta
		
		# Did we hit the ceiling again?
		if position.y <= start_position.y:
			position.y = start_position.y # Snap to ceiling
			_wait_at_ceiling() # Trigger the pause!

# We put the timer in its own little function to keep the physics clean
func _wait_at_ceiling():
	is_waiting = true # Turn on the lock
	
	# Wait for the time you set in the Inspector
	await get_tree().create_timer(wait_time).timeout 
	
	# Timer is done! Unlock and let it drop!
	is_falling = true
	is_waiting = false

func _on_body_entered(body):
	if body.is_in_group("player"):
		print("Player hit! Restarting level...")
		get_tree().reload_current_scene()
	else:
		# HIT THE FLOOR!
		if floor_y == 0.0:
			floor_y = position.y - 8 # Adjust this number if it clips!
			
		position.y = floor_y 
		
		# Instantly start going back up! (No waiting here anymore)
		is_falling = false

extends CharacterBody2D

@export var speed: float = 10.0
@export var jump_power: float = 10.0

var speed_multiplier = 30.0
var jump_multiplier = -30.0
var direction: float = 0.0
var gravity: float = 0.0

#const SPEED = 300.0
#const JUMP_VELOCITY = -400.0



func _ready() -> void:
	gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
	GameManager.register_player(self)
	PlayerManager.register_player(self)

func _physics_process(delta):
	#Add the gravity
	if not is_on_floor():
		velocity.y += gravity * delta
		
	#handle Jump
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = jump_power * jump_multiplier
		
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	direction = Input.get_axis("move_left", "move_right")
	if direction:
		velocity.x = direction * speed * speed_multiplier
	else:
		velocity.x = move_toward(velocity.x, 0, speed * speed_multiplier)
		
	move_and_slide()


func _on_area_2d_body_entered(body: Node2D) -> void:
	print("hit: ", body.name)
	GameManager.respawn_player()

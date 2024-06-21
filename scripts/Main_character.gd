extends CharacterBody2D

enum CHARACTER_DIRECTION { LEFT, RIGHT }

const SPEED = 300.0
const JUMP_VELOCITY = -600.0
# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

@onready var level_manager = %LevelManager

@onready var animated_sprite_2d = $AnimatedSprite2D
var character_direction: CHARACTER_DIRECTION;
func _ready():
	character_direction = CHARACTER_DIRECTION.RIGHT

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, 30)

	move_and_slide();
	
	# walking direction 
	UpdateCharacterDirection(velocity.x);
	
	# animations
	UpdateCharacterAnimation(velocity.x);
	CheckBoundaries(position.y);
	

func UpdateCharacterDirection(x_velocity: float):
	if x_velocity < 0:
		character_direction = CHARACTER_DIRECTION.LEFT
	elif x_velocity > 0:
		character_direction = CHARACTER_DIRECTION.RIGHT
	
	match character_direction:
		CHARACTER_DIRECTION.LEFT:
			animated_sprite_2d.flip_h = true
		CHARACTER_DIRECTION.RIGHT:
			animated_sprite_2d.flip_h = false
			
func UpdateCharacterAnimation(x_velocity: float):
	if ((x_velocity > 1 || x_velocity < -1) && is_on_floor()):
		animated_sprite_2d.animation = "run"
	elif not is_on_floor():
		animated_sprite_2d.animation = "jump"
	else:
		animated_sprite_2d.animation = "idle"

func CheckBoundaries(y_position: float):
	if y_position > 2000:
		game_lost();
		
func game_lost():
	level_manager.game_lost();

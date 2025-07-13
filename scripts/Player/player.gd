class_name Player
extends CharacterBody2D

const CardinalDirections: Dictionary[String, String] =  {
	'Left': 'left', 
	'Right': 'right', 
	'Up': 'up', 
	'Down': 'down',
	'UpLeft': 'up-left',
	'UpRight': 'up-right',
	'DownLeft': 'down-left',
	'DownRight': 'down-right'
}

@export var IdleState: PlayerIdleState
@export var DeadState: PlayerDeadState
@export var PlayerAnimation: AnimatedSprite2D
@export var HealthBarScene: HealthBar
@export var walk_speed := 40
@export var total_dash_distance := 100
@export var dash_delay_timer: Timer
@export var dash_delay_length := 0.1
# health needs to be float because delta is a float, otherwise it will round down, causing health to decrease rapidly
@export var health := 100.0
@export var damage_delay_timer: Timer
@export var damage_delay_length := .5

var can_take_damage := true
var can_player_dash := true
var CurrentState: PlayerState
var cardinal_direction: String = CardinalDirections.get("Down")

func _ready():
	change_state(IdleState)
	HealthBarScene.init_health(health, Color.FOREST_GREEN)
	set_dash_delay_timer()
	set_damage_delay_timer()

func set_dash_delay_timer():
	dash_delay_timer.one_shot = true
	dash_delay_timer.wait_time = dash_delay_length
	dash_delay_timer.timeout.connect(player_can_dash)

func set_damage_delay_timer():
	damage_delay_timer.one_shot = true
	damage_delay_timer.wait_time = damage_delay_length
	damage_delay_timer.timeout.connect(player_can_take_damage)

func change_state(new_state: PlayerState):
	CurrentState = new_state
	if CurrentState:
		CurrentState.enter_state(self)
		
func _process(delta: float) -> void:
	if CurrentState:
		CurrentState.handle_process(delta)

func start_dash_delay_timer():
	dash_delay_timer.start()

func player_can_take_damage():
	can_take_damage = true
	
func player_can_dash():
	can_player_dash = true

func take_damage(amount: float):
	if health <= 0 and CurrentState is not PlayerDeadState:
		change_state(DeadState)
	elif (
		health > 0 
		and CurrentState is not PlayerDashState 
		and can_take_damage
	):
		can_take_damage = false
		damage_delay_timer.start()
		health -= amount
		HealthBarScene._set_health(health)

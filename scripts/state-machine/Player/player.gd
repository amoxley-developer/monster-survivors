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
@export var PlayerAnimation: AnimatedSprite2D
@export var walk_speed := 25
@export var total_dash_distance := 100
@export var dash_delay_length := 0.1
@export var can_player_dash := true

var CurrentState: PlayerState
var cardinal_direction: String = CardinalDirections.get("Down")

func _ready():
	change_state(IdleState)
	
func change_state(new_state: Node):
	if CurrentState:
		pass
	CurrentState = new_state
	if CurrentState:
		CurrentState.enter_state(self)
		
func _process(delta: float) -> void:
	if CurrentState:
		CurrentState.handle_process(delta)

func start_dash_delay_timer():
	get_tree().create_timer(dash_delay_length).timeout.connect(player_can_dash)
	
func player_can_dash():
	can_player_dash = true

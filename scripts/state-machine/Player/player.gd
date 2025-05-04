class_name Player
extends CharacterBody2D


const CardinalDirections: Dictionary[String, String] =  {
	'LEFT': 'left', 
	'RIGHT': 'right', 
	'UP': 'up', 
	'DOWN': 'down'
}

@export var IdleState: PlayerIdleState
@export var PlayerAnimation: AnimatedSprite2D
@export var walk_speed := 25
var CurrentState: PlayerState
var cardinal_direction: String = CardinalDirections.get("DOWN")

func _ready():
	change_state(IdleState)
	
func change_state(new_state: Node):
	if CurrentState:
		pass
	CurrentState = new_state
	if CurrentState:
		CurrentState.enter_state(self)
		
func _process(delta: float) -> void:
	var direction = Input.get_vector('ui_up', 'ui_right', 'ui_down', 'ui_left')
	if CurrentState:
		CurrentState.handle_process(delta)
	

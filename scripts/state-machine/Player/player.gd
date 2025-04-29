class_name Player
extends CharacterBody2D


const CardinalDirections: Dictionary[String, String] =  {
	'LEFT': 'left', 
	'RIGHT': 'right', 
	'UP': 'up', 
	'DOWN': 'down'
}

@export var idle_state: PlayerIdleState
@export var player_animation: AnimatedSprite2D
var current_state: PlayerState
var cardinal_direction: String = CardinalDirections.get("DOWN")

func _ready():
	change_state(idle_state)
	
func change_state(new_state: Node):
	if current_state:
		pass
	current_state = new_state
	if current_state:
		current_state.enter_state(self)
		
func _process(delta: float) -> void:
	var direction = Input.get_vector('ui_up', 'ui_right', 'ui_down', 'ui_left')
	if current_state:
		current_state.handle_process(delta)
	

class_name PlayerIdleState
extends PlayerState

@export var MovingState: PlayerMovingState
@export var idle_animation_length := 3.0
var idle_animation_timer: float

func enter_state(player_node: Player):
	super(player_node)
	idle_animation_timer = idle_animation_length
	set_sprite()

func handle_process(delta: float):
	if Input.get_vector('ui_up', 'ui_down', 'ui_left', 'ui_right'):
		player.change_state(MovingState)
	handle_animation_timer(delta)

func handle_animation_timer(delta: float) -> void:
	if idle_animation_timer > 0:
		idle_animation_timer -= delta
	elif idle_animation_timer <= 0:
		play_animation()
		idle_animation_timer = idle_animation_length

func set_sprite():
	player.player_animation.play('idle-' + player.cardinal_direction)
	player.player_animation.pause()
	
		
func play_animation():
	player.player_animation.play('idle-' + player.cardinal_direction)

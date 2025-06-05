class_name PlayerIdleState
extends PlayerState

@export var MovingState: PlayerMovingState
@export var DashState: PlayerDashState
@export var idle_animation_length := 3.0
var idle_animation_timer: float

func enter_state(player_node: Player):
	super(player_node)
	idle_animation_timer = idle_animation_length
	set_sprite()

func handle_process(delta: float):
	if Input.get_vector('up', 'down', 'left', 'right'):
		player.change_state(MovingState)
		return
	if Input.is_action_pressed("dash") and player.can_player_dash:
		player.change_state(DashState)
		return
	handle_animation_timer(delta)

func handle_animation_timer(delta: float) -> void:
	if idle_animation_timer > 0:
		idle_animation_timer -= delta
	elif idle_animation_timer <= 0:
		play_animation()
		idle_animation_timer = idle_animation_length

func set_sprite():
	var animation_direction := get_animation_direction()
	player.PlayerAnimation.play('idle-' + animation_direction)
	player.PlayerAnimation.pause()

func play_animation():
	player.PlayerAnimation.play('idle-' + player.cardinal_direction)

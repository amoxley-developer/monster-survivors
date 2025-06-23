class_name PlayerDeadState
extends PlayerState

# 1 second delay before the death animation plays
var death_animation_timer := 1.0
var animation_played := false

func enter_state(player_node: Player):
	super(player_node)
	handle_animation()
	

func handle_process(delta: float):
	if death_animation_timer > 0:
		death_animation_timer -= 1*delta
	elif not animation_played:
		handle_animation()
		animation_played = true

func handle_animation():
	if death_animation_timer > 0:
		player.PlayerAnimation.play('dead', 0)
		return
	
	player.PlayerAnimation.play('dead')
	return

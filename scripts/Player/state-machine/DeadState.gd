class_name PlayerDeadState
extends PlayerState

# 1 second delay before the death animation plays
var death_animation_delay := 1.0
var has_animation_played := false

func enter_state(player_node: Player) -> void:
	super(player_node)
	player.PlayerAnimation.play('dead', 0)

func handle_process(delta: float) -> void: 
	if death_animation_delay > 0:
		death_animation_delay -= delta
	elif not has_animation_played:
		has_animation_played = true
		handle_animation()

func handle_animation() -> void:
	player.PlayerAnimation.play('dead')

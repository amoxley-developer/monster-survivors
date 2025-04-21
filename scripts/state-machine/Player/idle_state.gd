class_name PlayerIdleState
extends PlayerState

func enter_state(player_node: Player):
	super(player_node)
	player.velocity = Vector2.ZERO

func set_sprite(player_node: Player):
	pass

func handle_input(_delta):
	pass
	#if Input.get_axis("ui_up", "ui_down") or Input.get_axis("ui_left", "ui_right"):
		#player.change_state(MovingState)

class_name EnemyPossum
extends CharacterBody2D

@export var player: Player
@export var enemyPossumMoveState: EnemyPossumMoveState
@export var healthBarScene: HealthBar
@export var move_speed := 20
@export var health := 10.0

var has_player_contact := false

var CurrentState: EnemyPossumState

func _ready() -> void:
	healthBarScene.init_health(health, Color.CRIMSON)
	change_state(enemyPossumMoveState)

func change_state(new_state: EnemyPossumState):
	CurrentState = new_state
	if CurrentState:
		CurrentState.enter_state(self)

func _process(delta: float) -> void:
	# remove this after finishing with testing
	take_damage(delta)
	if CurrentState:
		CurrentState.handle_process(delta)

func _on_area_2d_body_entered(body: Node2D) -> void:
	var has_player_contact = true

func _on_area_2d_body_exited(body: Node2D) -> void:
	var has_player_contact = false

func take_damage(amount: float):
	if health <= 0:
		# add some kind of death logic
		# freeze animation
		# queue free this
		pass
	else:
		health -= amount
		healthBarScene._set_health(health)

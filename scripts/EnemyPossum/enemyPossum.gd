class_name EnemyPossum
extends CharacterBody2D

@export var player: Player
@export var enemyPossumMoveState: EnemyPossumMoveState
@export var enemyPossumDeadState: EnemyPossumDeadState
@export var healthBarScene: HealthBar
@export var move_speed := 20
@export var health := 10.0

var has_player_contact := false

var currentState: EnemyPossumState

func _ready() -> void:
	healthBarScene.init_health(health, Color.CRIMSON)
	change_state(enemyPossumMoveState)

func change_state(new_state: EnemyPossumState):
	currentState = new_state
	if currentState:
		currentState.enter_state(self)

func _process(delta: float) -> void:
	# remove this after finishing with testing
	take_damage(delta * 2)
	if currentState:
		currentState.handle_process(delta)
	# if currentState == enemyPossumDeadState:
	# 	print('still processing')

func _on_area_2d_body_entered(body: Node2D) -> void:
	var has_player_contact = true

func _on_area_2d_body_exited(body: Node2D) -> void:
	var has_player_contact = false

func take_damage(amount: float):
	if health <= 0 and currentState != enemyPossumDeadState:
		change_state(enemyPossumDeadState)
	elif health > 0:
		health -= amount
		healthBarScene._set_health(health)

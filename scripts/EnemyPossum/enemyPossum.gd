class_name EnemyPossum
extends CharacterBody2D

@export var player: Player
@export var enemyPossumMoveState: EnemyPossumMoveState
@export var move_speed := 20

var CurrentState: EnemyPossumState

func _ready() -> void:
	change_state(enemyPossumMoveState)

func change_state(new_state: EnemyPossumState):
	CurrentState = new_state
	if CurrentState:
		CurrentState.enter_state(self)

func _process(delta: float) -> void:
	if CurrentState:
		CurrentState.handle_process(delta)

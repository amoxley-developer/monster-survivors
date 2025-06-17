class_name EnemyPossum
extends CharacterBody2D

@export var player: Player
@export var enemyPossumMoveState: EnemyPossumMoveState
@export var move_speed := 20
var has_player_contact := false

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


func _on_area_2d_body_entered(body: Node2D) -> void:
	var has_player_contact = true


func _on_area_2d_body_exited(body: Node2D) -> void:
	var has_player_contact = false

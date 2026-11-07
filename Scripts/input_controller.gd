extends Node

@export var player: Player

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var move_left = Input.is_action_pressed("Left")
	var move_right = Input.is_action_pressed("Right")
	player.move_left = move_left && !move_right
	player.move_right = move_right && !move_left

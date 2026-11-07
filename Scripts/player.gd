@tool
extends Node2D
class_name Player

@export var SIZE: Vector2 = Vector2(200, 50): 
	get: 
		return SIZE
	set(value):
		SIZE = value
		update_size()
@export var speed: float
@export var player_colored_box: Sprite2D
@export var collision_box: CollisionShape2D

signal something_hit_me

var move_left: bool = false
var move_right: bool = false

func update_size():
	if player_colored_box != null:
		player_colored_box.scale = SIZE
	if collision_box != null: 
		collision_box.shape.size = SIZE
		
func _process(delta: float) -> void:
	if move_left && !move_right:
		position.x -= speed * delta
	if move_right && !move_left:
		position.x += speed * delta
	position.x = clamp(position.x, SIZE.x / 2, get_window().size.x - SIZE.x / 2)


func _on_area_2d_area_entered(area: Area2D) -> void:
	something_hit_me.emit(self, area)

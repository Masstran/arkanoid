@tool
extends Node2D
class_name CollidableRectangle

@export var SIZE: Vector2 = Vector2(200, 50): 
	get: 
		return SIZE
	set(value):
		SIZE = value
		update_size()
@export var player_colored_box: Sprite2D
@export var collision_box: CollisionShape2D


func update_size():
	if player_colored_box != null:
		player_colored_box.scale = SIZE
	if collision_box != null: 
		collision_box.shape.size = SIZE

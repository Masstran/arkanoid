@tool
extends Node2D

@export var RADIUS: float = 10: 
	get: 
		return RADIUS
	set(value):
		RADIUS = value
		update_radius()
@export var sprite_circle: Sprite2D
@export var collision_circle: CollisionShape2D
@export var speed: float = 20
@export var world_border: Area2D 

var ball_moving: bool = true
var direction: Vector2 = Vector2(0, 0);

func update_radius():
	if sprite_circle != null:
		var original_size: Vector2 = sprite_circle.texture.get_size()
		sprite_circle.scale = Vector2(2 * RADIUS / original_size.x, 2 * RADIUS / original_size.y)
		
	if collision_circle != null:
		collision_circle.shape.radius = RADIUS

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if not Engine.is_editor_hint():
		if direction == Vector2(0,0):
			var angle = randf_range(0, 2*PI)
			direction = Vector2(cos(angle), sin(angle))
		
		if ball_moving:
			position += direction * speed * delta


func _on_side_border_area_entered(area: Area2D) -> void:
	direction.x *= -1


func _on_top_border_area_entered(area: Area2D) -> void:
	direction.y *= -1


#func _on_area_2d_area_entered(area: Area2D) -> void:
	#direction.y *= -1 # Replace with function body.


func _on_player_something_hit_me(player: Player, area: Area2D) -> void:
	#if (player.position.x + player.SIZE.x / 2 < position.x) || (player.position.x - player.SIZE.x / 2 > position.x):
		#direction.x *= -1
	#else:
	direction.y *= -1
	direction.x = -(player.position.x - position.x) * 2 / player.SIZE.x

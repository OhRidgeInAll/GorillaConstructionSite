extends Area2D

const BASE_LADDER_AREA = 32

@export var length = 2
@export var can_be_rolled = false
@export var roll_chance = 0.5
@export var ladder_top_length: float = 6

@onready var sprite_2d = $Sprite2D
@onready var collision_shape_2d = $CollisionShape2D


func _ready():
	sprite_2d.region_rect = Rect2(0, BASE_LADDER_AREA * length, BASE_LADDER_AREA, BASE_LADDER_AREA * length)
	
	collision_shape_2d.shape = RectangleShape2D.new()
	collision_shape_2d.shape.set_size(Vector2(0.025, length * BASE_LADDER_AREA + ladder_top_length))
	var collision_shape_y = BASE_LADDER_AREA * (length - 1)
	collision_shape_2d.position.y = -ladder_top_length

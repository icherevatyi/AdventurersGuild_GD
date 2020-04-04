extends Node2D

const DIRECTION: Dictionary =  {
	"UP": Vector2(0, -1),
	"DOWN": Vector2(0, 1),
	"LEFT": Vector2(-1, 0),
	"RIGHT": Vector2(1, 0),
}

export var _movement_speed: int

var _movement: Vector2 = Vector2(0, 0)

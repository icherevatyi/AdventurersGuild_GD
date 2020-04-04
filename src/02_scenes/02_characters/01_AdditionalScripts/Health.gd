extends Node2D

var _health_max: int = 100
var _health_current: int


func _ready() -> void:
	_health_current = 1


func receive_healing(value: int) -> void:
	_health_current += value
	_health_current = min(_health_current, _health_max)
	print(_health_current)


func receive_damage(value: int) -> void:
	_health_current -= value
	if _health_current <= 0:
		die()


func die() -> void:
	print("oops, i'm dead'")
	call_deferred("queue_free")

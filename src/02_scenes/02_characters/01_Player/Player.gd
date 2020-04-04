extends KinematicBody2D

signal take_damage
signal heal

export var _movement_speed: int = 150

var _movement: Vector2 = Vector2(0, 0)
onready var _health_script: Node2D = $AdditionalScripts/Health
onready var _movement_script: Node2D = $AdditionalScripts/Movement


func _ready() -> void:
	_connect_signal("take_damage", _health_script, "receive_damage")
	_connect_signal("heal", _health_script, "receive_healing")


func _input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_accept"):
		emit_signal("heal", 30)


func _physics_process(_delta) -> void:
	move_player()


func move_player() -> void:
	_movement.x = (Input.get_action_strength("move_right") - Input.get_action_strength("move_left")) * _movement_speed
	_movement.y = (Input.get_action_strength("move_down") - Input.get_action_strength("move_up")) * _movement_speed
	
	_movement = move_and_slide(_movement, Vector2(0, 0))


func _connect_signal(signal_name: String, target_node: Node, target_function: String) -> void:
	match is_connected(signal_name, target_node, target_function):
		false:
			var connect: int = connect(signal_name, target_node, target_function)
			if connect == 0:
				pass
			else:
				print("Signal connection warning: ", connect)


# this might need  to be updated to pass right damage params! 
func _on_HurtBox_area_entered(area: Area2D, damage: int) -> void:
	if area.name == "HitBox":
		emit_signal("take_damage", damage)

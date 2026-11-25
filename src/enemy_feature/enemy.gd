extends CharacterBody2D

signal enemy_action(damage: int)

@onready var health: EnemyHealth = $EnemyHealth

func _ready() -> void:
	get_parent().enemy_targeted.connect(_action_incoming)
	health.enemy_die.connect(_is_dead)
	
func do_action():
	enemy_action.emit(10)

func _is_dead():
	queue_free()
	
	
func _action_incoming(amount):
	if(amount > 0):
		health.take_damage(amount)
	else:
		health.heal(amount)

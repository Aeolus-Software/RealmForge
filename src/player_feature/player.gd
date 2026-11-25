extends CharacterBody2D

signal dead

@onready var health: PlayerHealth = $PlayerHealth

func _ready() -> void:
	print("Player starts with ", VariationConfigs.player_starting_health, " HP")
	get_parent().player_targeted.connect(_action_incoming)
	health.player_die.connect(_is_dead)

func _is_dead():
	dead.emit()
	
	
func _action_incoming(amount):
	if(amount > 0):
		health.take_damage(amount)
	else:
		health.heal(amount)

extends Node2D

signal action_selected(action: String)
signal next_turn(player_turn: bool)
signal enemy_targeted(health: int)
signal player_targeted(health: int)

var ui_config = VariationConfigs.selected_combat_ui
var ui_scene
var ui_instance
var encounter_done = false

	

@onready var player = $Player
@onready var enemy = $Enemy

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print("UI option ", ui_config, " Selected")
	if ui_config == 0:
		ui_scene = load("res://combat_feature/combat_screen.tscn")
		ui_instance = ui_scene.instantiate()
	else:
		ui_scene = load("res://combat_feature/combat_action_wheel.tscn")
		ui_instance = ui_scene.instantiate()
	add_child(ui_instance)
	ui_instance.action_selected.connect(_on_action_selected)
	enemy.enemy_action.connect(_on_enemy_action_selected)
	player.health.player_die.connect(_on_defeat)
	enemy.health.enemy_die.connect(_on_victory)
	next_turn.connect(ui_instance.set_input_enabled)
	next_turn.emit(true)
	
func _on_action_selected(action: String) -> void:
	if action == "Attack 1":
		print("Player attacks enemy for 10 health")
		enemy_targeted.emit(10)
	elif action == "Attack 2":
		print("Player attacks enemy for 33 health")
		enemy_targeted.emit(33)
	elif action == "Heal":
		print("Player heals 10 health")
		player_targeted.emit(-10)
	elif action == "Block":
		print("Player doesn't know how to block yet, does nothing :(")
	
	next_turn.emit(false) # Not player turn anymore
	if not encounter_done:
		await get_tree().create_timer(1).timeout
		enemy.do_action()
		
func _on_enemy_action_selected(damage: int):
	player_targeted.emit(damage)
	if not encounter_done:
		next_turn.emit(true)
	
func _on_defeat():
	encounter_done = true
	next_turn.emit(false)
	var death_screen_scene = preload("res://combat_feature/death_screen.tscn")
	var death_screen = death_screen_scene.instantiate()
	add_child(death_screen)
	
func _on_victory():
	encounter_done = true
	next_turn.emit(false)
	var win_screen_scene = preload("res://combat_feature/win_screen.tscn")
	var win_screen = win_screen_scene.instantiate()
	add_child(win_screen)

	

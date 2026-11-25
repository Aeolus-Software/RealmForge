extends CanvasLayer

signal action_selected(action)

@onready var player_button = $WheelContainer/PlayerButton
@onready var attack1_button = $WheelContainer/Attack1Button
@onready var attack2_button = $WheelContainer/Attack2Button
@onready var heal_button = $WheelContainer/HealButton
@onready var block_button = $WheelContainer/BlockButton
@onready var exit_button = $ExitButton

var wheel_open = false


func _ready():
	player_button.pressed.connect(open_wheel)
	attack1_button.button_up.connect(_on_action_1_button_up)
	attack2_button.button_up.connect(_on_action_2_button_up)
	heal_button.button_up.connect(_on_action_3_button_up)
	block_button.button_up.connect(_on_action_4_button_up)
	exit_button.pressed.connect(return_to_menu)
	open_buttons(false)


func open_wheel():
	wheel_open = not wheel_open
	open_buttons(wheel_open)

func open_buttons(show_buttons):
	attack1_button.visible = show_buttons
	attack2_button.visible = show_buttons
	heal_button.visible = show_buttons
	block_button.visible = show_buttons

func _on_action_1_button_up():
	combat_action_chosen("Attack 1")

func _on_action_2_button_up():
	combat_action_chosen("Attack 2")

func _on_action_3_button_up():
	combat_action_chosen("Heal")

func _on_action_4_button_up():
	combat_action_chosen("Block")

func combat_action_chosen(combat_action):
	print(combat_action)
	action_selected.emit(combat_action)
	wheel_open = false
	open_buttons(false)

func set_input_enabled(enabled):
	if enabled:
		print("Player Turn")
	attack1_button.disabled = not enabled
	attack2_button.disabled = not enabled
	heal_button.disabled = not enabled
	block_button.disabled = not enabled

func return_to_menu():
	print("returning to debug menu")
	get_tree().change_scene_to_file("res://game.tscn")

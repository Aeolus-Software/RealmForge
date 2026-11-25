extends CharacterBody2D
func _ready():
	print("Player starts with ", VariationConfigs.player_starting_health, " HP")

func _on_action_1_button_up():
	print("Attack #1 pressed")

func _on_action_2_button_up():
	print("Attack #2")
	
func _on_action_3_button_up():
	print("Heal")
	
func _on_action_4_button_up():
	print("Block")

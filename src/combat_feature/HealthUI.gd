
extends TextureProgressBar

# Reference to the parent entity
@onready var player: Health = get_parent()

@onready var health_label: Label = $HealthLabel

var health_tween: Tween


func _ready() -> void:
	# Connect signals
	player.health_changed.connect(_on_health_changed)
	player.max_health_changed.connect(_on_max_health_changed)

	# Initialize health bar
	max_value = player.max_health
	value = player.current_health

	# Initialize label
	_update_health_label()


func _on_health_changed(new_health: int) -> void:
	# Stop any existing animation
	if health_tween and health_tween.is_running():
		health_tween.kill()

	# Animate health bar
	health_tween = create_tween()
	health_tween.tween_property(self, "value", new_health, 1.0).set_trans(Tween.TRANS_SINE).set_delay(0.5)

	_update_health_label()


func _on_max_health_changed(new_max_health: int) -> void:
	max_value = new_max_health

	_update_health_label()


func _update_health_label() -> void:
	health_label.text = str(player.current_health) + "/" + str(player.max_health)

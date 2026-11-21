extends VBoxContainer

@onready var _selected_ui_option_label: Label = $SelectedUIOption
const CombatUIType = VariationConfigs.CombatUIType

var _selected_combat_ui: CombatUIType = CombatUIType.OPTION_1

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	_update_combat_ui_type(CombatUIType.OPTION_1)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_combat_ui_option_1_toggled(toggled_on: bool) -> void:
	if toggled_on:
		_update_combat_ui_type(CombatUIType.OPTION_1)


func _on_combat_ui_option_2_toggled(toggled_on: bool) -> void:
	if toggled_on:
		_update_combat_ui_type(CombatUIType.OPTION_2)

func _update_combat_ui_type(ui_type: CombatUIType) -> void:
	_selected_combat_ui = ui_type
	
	match _selected_combat_ui:
		CombatUIType.OPTION_1:
			_selected_ui_option_label.text = "Option 1 Selected"
		CombatUIType.OPTION_2:
			_selected_ui_option_label.text = "Option 2 Selected"

func get_selected_combat_ui_option() -> CombatUIType:
	return _selected_combat_ui

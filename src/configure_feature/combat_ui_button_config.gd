extends VBoxContainer

@onready var _selected_ui_option_label: Label = $SelectedUIOption
const CombatUIType = VariationConfigs.CombatUIType
signal combat_ui_type_edited(ui_type: VariationConfigs.CombatUIType)

var _selected_combat_ui: CombatUIType = VariationConfigs.selected_combat_ui

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	_selected_combat_ui = VariationConfigs.selected_combat_ui
	_update_combat_ui_type(_selected_combat_ui)

func _on_combat_ui_option_1_toggled(toggled_on: bool) -> void:
	if toggled_on:
		_update_combat_ui_type(CombatUIType.OPTION_1)

func _on_combat_ui_option_2_toggled(toggled_on: bool) -> void:
	if toggled_on:
		_update_combat_ui_type(CombatUIType.OPTION_2)

func _update_combat_ui_type(ui_type: CombatUIType) -> void:
	_selected_combat_ui = ui_type
	combat_ui_type_edited.emit(_selected_combat_ui)
	
	match _selected_combat_ui:
		CombatUIType.OPTION_1:
			_selected_ui_option_label.text = "Option 1 Selected"
		CombatUIType.OPTION_2:
			_selected_ui_option_label.text = "Option 2 Selected"

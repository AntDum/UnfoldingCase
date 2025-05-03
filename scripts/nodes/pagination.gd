extends MarginContainer

@export var tab : TabContainer

@onready var prev_button: Button = %PrevButton
@onready var next_button: Button = %NextButton

func _ready() -> void:
	_update()

func _update() -> void:
	prev_button.visible = true
	next_button.visible = true
	if tab.current_tab <= 0:
		prev_button.visible = false
	if tab.current_tab >= tab.get_tab_count() - 1:
		next_button.visible = false

func _change_tab(delta: int) -> void:
	tab.current_tab += delta
	_update()

func _on_prev_button_pressed() -> void:
	_change_tab(-1)

func _on_next_button_pressed() -> void:
	_change_tab(1)

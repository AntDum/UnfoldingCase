extends Control
class_name CharacterControl

var char : Character

@onready var texture_rect: TextureRect = %TextureRect
@onready var label: Label = %Label

func _enter_tree() -> void:
	EventBus.game_started.connect(_update)

func _ready() -> void:
	if char != null:
		_update()

func _update() -> void:
	if not is_node_ready(): return
	texture_rect.texture = char.texture
	label.text = char.name

func _on_not_ok_button_pressed() -> void:
	EventBus.accuse.emit(char.idx)

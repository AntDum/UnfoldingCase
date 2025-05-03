extends Node
class_name GameManager

@export var character_generator : CharacterGenerator

@export var character_controls : Array[CharacterControl]

var characters : Array[Character]

func _enter_tree() -> void:
	EventBus.accuse.connect(_accused)

func _ready() -> void:
	_start_game()

func _start_game() -> void:
	_update_character()
	EventBus.game_started.emit()

func _update_character() -> void:
	var n_char = len(character_controls)
	characters = character_generator.generate_character(n_char)
	for i in range(n_char):
		character_controls[i].char = characters[i]

func _accused(idx: int) -> void:
	prints("Character", idx, "->", characters[idx].name, "was accused")

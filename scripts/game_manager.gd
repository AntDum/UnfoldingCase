extends Node
class_name GameManager

@export var character_generator : CharacterGenerator
@export var item_generator : ItemGenerator

@export var character_controls : Array[CharacterControl]
@export var luggage_controls : Array[Node]

var characters : Array[Character]

func _enter_tree() -> void:
	EventBus.accuse.connect(_accused)

func _ready() -> void:
	_start_game()

func _start_game() -> void:
	_update_character()
	_update_content()
	EventBus.game_started.emit()

func _update_content() -> void:
	var item_disc = 2
	var item_in_luggage = 4
	item_generator.pre_generate(item_disc)
	var contents : Array[Array] = []
	contents.append(item_generator.generate_final_content(item_disc, item_in_luggage))
	for i in range(len(luggage_controls) - 1):
		contents.append(item_generator.generate_final_content(0, item_in_luggage))
	contents.shuffle()
	for i in range(len(luggage_controls)):
		pass

func _update_character() -> void:
	var n_char = len(character_controls)
	characters = character_generator.generate_character(n_char)
	for i in range(n_char):
		character_controls[i].char = characters[i]

func _accused(idx: int) -> void:
	prints("Character", idx, "->", characters[idx].name, "was accused")

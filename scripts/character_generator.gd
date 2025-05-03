extends Node
class_name CharacterGenerator

@export var names : Array[String]
@export var textures : Array[Texture2D]

func _get_random_character(idx: int) -> Character:
	var character = Character.new()
	character.name = names.pick_random()
	character.texture = textures.pick_random()
	character.idx = idx
	return character

func generate_character(n: int) -> Array[Character]:
	var characters : Array[Character] = []
	for i in range(n):
		characters.append(_get_random_character(i))
	return characters

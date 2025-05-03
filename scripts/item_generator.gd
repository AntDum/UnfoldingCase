extends Node
class_name ItemGenerator

@export var items : Array[ItemRessource]

var disc_items : Array[ItemRessource]
var herring_items : Array[ItemRessource]

func _generate_disc_items(disc_count: int) -> Array[ItemRessource]:
	items.shuffle()
	return items.slice(0, disc_count + 1)

func _generate_herring_items_list(disc_items: Array[ItemRessource]) -> Array[ItemRessource]:
	var herring_items: Array[ItemRessource] = []
	for item in items:
		if not disc_items.has(item):
			herring_items.append(item)
	return herring_items

func pre_generate(disc_count: int) -> void:
	disc_items = _generate_disc_items(disc_count)
	herring_items = _generate_herring_items_list(disc_items)

func generate_final_content(discr_items_count: int, total_item: int) -> Array[ItemRessource]:
	var final_content: Array[ItemRessource] = []
	disc_items.shuffle()
	herring_items.shuffle()
	
	for i in range(discr_items_count):
		final_content.append(disc_items[i])
	for i in range(total_item - discr_items_count):
		final_content.append(herring_items[i])
		
	final_content.shuffle()
	return final_content

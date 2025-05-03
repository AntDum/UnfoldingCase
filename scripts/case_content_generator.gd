extends Node
class_name ContentGenerator

const TOTAL_ITEMS_COUNT: int = 3


@export var discr_items: Array[ItemRessource]
@export var herring_items: Array[ItemRessource]


func generate_final_content(discr_items_count: int, discr_items: Array[ItemRessource], herring_items: Array[ItemRessource]) -> Array[ItemRessource]:
	var final_content: Array[ItemRessource] = []
	for i in range(discr_items_count):
		final_content.append(discr_items[randi_range(0, discr_items.size()-1)])
	for i in range(TOTAL_ITEMS_COUNT - discr_items_count):
		final_content.append(herring_items[randi_range(0, herring_items.size()-1)])
	final_content.shuffle()
	return final_content

# Test function
#func _on_button_up() -> void:
#	for i in generate_final_content(1, discr_items, herring_items):
#		print (i.name)
#	print("------")

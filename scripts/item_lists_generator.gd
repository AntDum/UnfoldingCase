extends Node

@export var all_items: Array[ItemRessource] = []


func generate_disc_items_list(disc_items_count: int) -> Array[ItemRessource]:
	var disc_items: Array[ItemRessource] = []
	for i in range(disc_items_count):
		while disc_items.size() < disc_items_count:
			var item = all_items[randi_range(0, all_items.size() -1)]
			if not disc_items.has(item):
				disc_items.append(item)
	return disc_items

func generate_herring_items_list(disc_items: Array[ItemRessource]) -> Array[ItemRessource]:
	var herring_items: Array[ItemRessource] = []
	for item in all_items:
		if not disc_items.has(item):
			herring_items.append(item)
	return herring_items

func generate_lists():
	var final_disc_items = generate_disc_items_list(2)
	var final_herring_items = generate_herring_items_list(final_disc_items)
	
	print("disc items:")
	for item in final_disc_items:
		print(item.name)
	print("herring items:")
	for item in final_herring_items:
		print(item.name)

extends RefCounted
class_name LuggageGenerator

func generate(items: Array) -> Pocket:
	print(items)
	
	if len(items) == 0:
		return null
	
	elif len(items) == 1:
		var leaf = Pocket.new()
		leaf.add_contained_item(items[0])
		return leaf
		
	else:
		var root = Pocket.new()
		
		var items_left_half = items.slice(0,len(items)/2)
		var left = generate(items_left_half)
		
		var items_right_half = items.slice(len(items)/2)
		var right = generate(items_right_half)
		
		root.add_pockets(left, right)
		
		return root

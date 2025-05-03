extends RefCounted
class_name Pocket

var left_pocket : Pocket
var right_pocket : Pocket
var contained_item : int #ItemRessource
	
func _init() -> void:
	pass

func add_pockets(left: Pocket, right: Pocket) -> void:
	left_pocket = left
	right_pocket = right

func add_contained_item(item : int) -> void:
	contained_item = item

func _to_string() -> String:
	return str(contained_item) + ", " + str(left_pocket) + ", " +str(right_pocket)

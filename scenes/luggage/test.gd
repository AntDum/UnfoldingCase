extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var lg = LuggageGenerator.new()
	var t = lg.generate([1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 15, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30])
	$Luggage.get_pocket_tree(t) # Replace with function body.
	$Luggage.fold()
	$Luggage.show()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var lg = LuggageGenerator.new()
	var t = lg.generate([1, 2, 3, 4, 5])
	$Luggage.get_pocket_tree(t) # Replace with function body.
	$Luggage.fold()
	$Luggage.show()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

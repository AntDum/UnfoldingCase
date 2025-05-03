extends Node2D

var luggage_node = preload("res://scenes/luggage/luggage.tscn")

var is_folded = true
var sub_pockets : Array = []
var contained_item = null
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for sp in sub_pockets:
		sp.hide()

func fold():
	for sp in sub_pockets:
		sp.hide_and_fold()

func hide_and_fold():
	hide()
	for sp in sub_pockets:
		sp.hide_and_fold()

func unfold():
	if contained_item:
		print("Showing " + str(contained_item))
	$Sprite2D.visible = true
	for sp in sub_pockets:
		sp.show()
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func get_pocket_tree(pt : Pocket, horizontal_split = 1):
	if pt.left_pocket:
		var new_pocket_node = luggage_node.instantiate()
		new_pocket_node.get_pocket_tree(pt.left_pocket, 1 - horizontal_split)
		add_child(new_pocket_node)
		new_pocket_node.position.x = -120 * horizontal_split
		new_pocket_node.position.y = -120 * (1 - horizontal_split)
		new_pocket_node.scale = Vector2(0.8,  0.8)
		sub_pockets.append(new_pocket_node)
	if pt.right_pocket:
		var new_pocket_node = luggage_node.instantiate()
		new_pocket_node.get_pocket_tree(pt.right_pocket, 1 - horizontal_split)
		add_child(new_pocket_node)
		new_pocket_node.position.x = 120 * horizontal_split
		new_pocket_node.position.y = 120 * (1 - horizontal_split)
		new_pocket_node.scale = Vector2(0.8, 0.8)
		sub_pockets.append(new_pocket_node)
	if pt.contained_item:
		contained_item = pt.contained_item
		
		


func _on_area_2d_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton:
		if event.pressed:
			if is_folded:
				unfold()
			else:
				fold()
			is_folded = !is_folded

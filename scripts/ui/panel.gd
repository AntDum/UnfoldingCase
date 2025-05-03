extends AnimatedControl

func _enter_tree() -> void:
	SceneManager.end_scene_transition.connect(animate_show)

func _on_open_button_pressed() -> void:
	animate_show()


func _on_close_button_pressed() -> void:
	animate_hide()

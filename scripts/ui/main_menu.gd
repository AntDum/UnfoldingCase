extends Control

const GAME = "res://scenes/game.tscn"

func _on_play_button_pressed() -> void:
	SceneManager.swap_scene(GAME)

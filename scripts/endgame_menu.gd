extends Node

func _on_button_pressed():
	GameManager.change_level(GameManager.current_level);



func _on_button_2_pressed():
	GameManager.quit_game();

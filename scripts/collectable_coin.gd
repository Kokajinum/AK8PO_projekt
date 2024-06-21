extends Area2D

@onready var level_manager = %LevelManager

func _on_body_entered(body):
	if (body.name == "CharacterBody2D"):
		queue_free()
		add_collected_coins();

func add_collected_coins():
	level_manager.add_collected_coins();
	GameManager.add_collected_coins();
	print(GameManager.collected_coins);

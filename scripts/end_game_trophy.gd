extends Area2D

@export var target_level : int
#@onready var game_manager = %GameManager
@onready var level_manager = %LevelManager


func _on_body_entered(body):
	if (body.name == "CharacterBody2D"):
		call_deferred("level_completed");

func level_completed():
	level_manager.level_completed(target_level);
	

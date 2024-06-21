extends Node

var collected_coins = 0;
var current_level_coins = 0;
var current_level = 0;
const SAVE_FILE_PATH = "user://save_data.json";

func add_collected_coins(coins_to_add: int = 1):
	collected_coins += coins_to_add;
	current_level_coins =+ coins_to_add;

func change_level(level: int = 1):
	current_level = level;
	current_level_coins = 0;
	if (level == 1):
		get_tree().change_scene_to_file("res://assets/scenes/levels/Level1.tscn");
	elif (level == 2):
		get_tree().change_scene_to_file("res://assets/scenes/levels/Level2.tscn");
	elif (level == 3):
		get_tree().change_scene_to_file("res://assets/scenes/levels/Level3.tscn")
	elif (level == 4):
		get_tree().change_scene_to_file("res://assets/scenes/main_menu.tscn");
		
func save_time(time: float, level: int):
	var save_data = load_save_data();
	if not save_data.has("best_times"):
		save_data["best_times"] = {};
	if not save_data["best_times"].has(str(level)) or time < save_data["best_times"][str(level)]:
		save_data["best_times"][str(level)] = time;
	save_data["last_time"] = time;
	var file = FileAccess.open(SAVE_FILE_PATH, FileAccess.WRITE);
	file.store_string(JSON.stringify(save_data));
	file.close();
	
func save_collected_coins(collected_coins: int, level: int):
	pass

func load_save_data() -> Dictionary:
	var file = FileAccess.open(SAVE_FILE_PATH, FileAccess.READ);
	if file:
		var save_data = JSON.parse_string(file.get_as_text());
		file.close();
		return save_data;
	return {"best_times": {}, "last_time": null};
		
		
func get_best_time(level: int):
	var save_data = load_save_data();
	if save_data["best_times"] != null and save_data["best_times"].has(str(level)):
		return save_data["best_times"][str(level)];
	return null;
	
func get_collected_coins(level: int):
	pass

func end_game():
	get_tree().change_scene_to_file("res://assets/scenes/endgame_menu.tscn");
	
func quit_game():
	get_tree().quit();


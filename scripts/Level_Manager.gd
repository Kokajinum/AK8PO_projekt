extends Node

@onready var label = %Label
@onready var best_time_label = %BestTime
@onready var current_time = %CurrentTime

var elapsed_time: float = 0.0;
var running: bool = true;
var current_level_coins = 0;

func _ready():
	reset_timer();
	var best_time = GameManager.get_best_time(GameManager.current_level);
	if best_time != null:
		best_time_label.text = String("Best time: %.2f" % best_time);

func _process(delta):
	if (running):
		elapsed_time += delta;
		current_time.text = String("Current time: %.2f" % elapsed_time);

func add_collected_coins(coins_to_add: int = 1):
	current_level_coins += coins_to_add;
	label.text = "Points: " + str(current_level_coins);

func reset_timer():
	elapsed_time = 0.0;
	resume_timer();

func stop_timer():
	running = false;
	
func resume_timer():
	running = true;

func level_completed(next_level: int):
	stop_timer();
	GameManager.save_time(elapsed_time, GameManager.current_level);
	GameManager.change_level(next_level);

func game_lost():
	GameManager.end_game();

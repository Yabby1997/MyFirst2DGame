extends Node

@export var mob_scene: PackedScene
var score = 0

func _ready() -> void:
	new_game()

func _process(delta: float) -> void:
	pass

func _on_start_timer_timeout() -> void:
	$MobTimer.start()
	$ScoreTimer.start()

func _on_score_timer_timeout() -> void:
	score += 1
	
func _on_mob_timer_timeout() -> void:
	spawn_mob()

func _on_player_hit() -> void:
	print("HIT")
	
func new_game():
	score = 0
	$Player.start($StartPosition.position)
	$StartTimer.start()

func game_over():
	$ScoreTimer.stop()
	$MobTimer.stop()

func spawn_mob():
	var mob_spawn_location = $MobPath/MobSpawnLocation
	mob_spawn_location.progress_ratio = randf()
	
	var mob = mob_scene.instantiate()
	mob.position = mob_spawn_location.position
	
	var direction = mob_spawn_location.rotation + PI / 2 + randf_range(-PI / 4, PI / 4)
	mob.rotation = direction
	
	var velocity = Vector2(randf_range(150.0, 250.0), 0.0)
	mob.linear_velocity = velocity.rotated(direction)
	
	add_child(mob)
	

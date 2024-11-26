extends CanvasLayer

signal start_game

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	pass

func _on_start_button_pressed() -> void:
	$MessageLabel.hide()
	$StartButton.hide()
	start_game.emit()
	
func update_score(score):
	$ScoreLabel.text = str(score)
	
func game_over():
	$MessageLabel.text = "Game Over"
	$MessageLabel.show()
	$MessageTimer.start()
	await $MessageTimer.timeout
	$MessageLabel.text = "Dodge the Creeps!"
	await get_tree().create_timer(1.0).timeout
	$StartButton.show()

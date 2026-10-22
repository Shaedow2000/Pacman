extends CanvasLayer

func increment_score(score: int) -> void:
	$Label.text = "Score: " + str(score)

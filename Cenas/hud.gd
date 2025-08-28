extends CanvasLayer

@onready var Fim: Timer =  $"../Fim"
signal reinicia

func _process(delta: float) -> void:
	$Fim.text = ("Tempo Restante: " + str(int(Fim.time_left)))


func _on_button_pressed() -> void:
	emit_signal("reinicia") # Replace with function body.

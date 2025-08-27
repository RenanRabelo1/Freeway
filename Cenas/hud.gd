extends CanvasLayer


# Called when the node enters the scene tree for the first time.

signal reinicia



func _on_button_pressed() -> void:
	emit_signal("reinicia") # Replace with function body.

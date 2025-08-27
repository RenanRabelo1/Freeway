extends RigidBody2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var tipos_carros = $Animacao.sprite_frames.get_animation_names()
	var carro = tipos_carros[randi_range(0, tipos_carros.size()-1)]
	$Animacao.animation = carro 	 
	$Animacao.play()

func _on_notificador_screen_exited() -> void:
	queue_free()# Replace with function body.

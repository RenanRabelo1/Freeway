extends RigidBody2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var tipos_carros = $AnimacaoOposta.sprite_frames.get_animation_names()
	var carro = tipos_carros[randi_range(0, tipos_carros.size()-1)]
	$AnimacaoOposta.animation = carro 	 
	$AnimacaoOposta.play()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _on_notificador_screen_exited() -> void:
	queue_free()# Replace with function body.

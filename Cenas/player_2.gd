extends Area2D


signal pontua 
@export var speed: float = 100.0
var screen_size: Vector2
var posicao_inicial: Vector2 = Vector2(760, 690)


func _ready() -> void:
	screen_size = get_viewport_rect().size
	position = posicao_inicial
	
func _process(delta: float) -> void:
	var velocity = Vector2.ZERO
	
	if Input.is_action_pressed("subir"):
		velocity.y -= 1
	if Input.is_action_pressed("baixo"):
		velocity.y += 1
	if Input.is_action_pressed("direita"):
		velocity.x += 1
	if Input.is_action_pressed("esquerda"):
		velocity.x -= 1
# Called every frame. 'delta' is the elapsed time since the previous frame.

	if velocity != Vector2.ZERO:
		velocity = velocity.normalized() * speed 
	
	position += velocity * delta 
	position.y = clamp(position.y, 3.0, screen_size.y)
	
	if velocity.y > 0:
		$Animacao2.play("baixo2")
	elif velocity.y < 0:
		$Animacao2.play("cima2")
	elif velocity.x > 0:
		$Animacao2.play("direita2")
	elif velocity.x < 0:
		$Animacao2.play("esquerda2")
	else:
		$Animacao2.stop()


func _on_body_entered(body: Node2D) -> void:
	if body.name == "LinhaChegada":
		emit_signal("pontua")
		position = posicao_inicial
	else:
		$Audio2.play()
		position = posicao_inicial




# Replace with function body.

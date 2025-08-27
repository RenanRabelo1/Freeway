extends Node

var cena_carros = preload("res://Cenas/carros.tscn")
var cena_carros_invertidos = preload("res://Cenas/carros_invertidos.tscn")
var pistas_rapidas_y = [104, 272, 488]
var pistas_lentas_y = [160, 216, 324, 384, 438, 544, 600]
var score = 0 
# Pistas para carros da ESQUERDA → DIREITA
var pistas_esquerda_direita_y = [104, 272, 488]

# Pistas para carros da DIREITA → ESQUERDA  
var pistas_direita_esquerda_y = [160, 216, 324, 384, 438, 544, 600]
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$HUD/Placar.text = str(score)
	$HUD/Mensagem.hide()
	$HUD/Button.hide()
	$AudioTema.play()
	randomize()




func _on_timer_carros_rapidos_timeout() -> void:
	var carro = cena_carros.instantiate()
	add_child(carro)
	# Só usa pistas da ESQUERDA → DIREITA
	var pista_y = pistas_esquerda_direita_y[randi_range(0, pistas_esquerda_direita_y.size() - 1)]
	carro.position = Vector2(-10, pista_y)
	carro.set_linear_velocity(Vector2(randf_range(900.0, 920.0), 0))  # Mais rápido!
	carro.set_linear_damp(0.0)

func _on_timer_carros_lentos_timeout() -> void:
	var carro = cena_carros.instantiate()
	add_child(carro)
	# Só usa pistas da DIREITA → ESQUERDA
	var pista_y = pistas_direita_esquerda_y[randi_range(0, pistas_direita_esquerda_y.size() - 1)]
	carro.position = Vector2(1300, pista_y)
	carro.scale
	carro.scale.y = -1
	carro.set_linear_velocity(Vector2(-randf_range(700.0, 720.0), 0))  # Mais lento
	carro.set_linear_damp(0.0)
	



func _on_player_pontua() -> void:
	if score <= 10:
		score += 1
		$HUD/Placar.text = str(score)
		$AudioPonto.play()
		$Player.position = $Player.posicao_inicial
	if score == 10:
		$HUD/Mensagem.show()
		$HUD/Button.show()
		$TimerCarrosRapidos.stop()
		$TimerCarrosLentos.stop()
		$AudioVitoria.play()
		$Player.speed = 0
		
		
		


func _on_hud_reinicia() -> void:
	get_tree().reload_current_scene()
	
	
var time = 0
var s = true
var final = 50.0  
var incrementar = 1  
var score1 = 0
func start_game_timer() -> void:

	
	time = 0
	s = true
	incrementar = 1  

	while time < final:
		await get_tree().create_timer(s).timeout
		time = min(time + s, final)
		$tempo.text = str(time)
		
		if score1==1:
			$tempo.text = str("ENCERRADO")
			

	s = false
   

func _on_fim_timeout() -> void:
	pass # Replace with function body.
	$player.position=$player.posicao_inicial
	$TimerCarrosLentos.stop()
	$TimerCarrosRapidos.stop()
	$Player.speed = 0
	

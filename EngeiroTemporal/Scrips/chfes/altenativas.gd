extends Node2D

@onready var button_1: Button = $alternativas/Button1
@onready var button_2: Button = $alternativas/Button2

@export_category("Objects")

const _DIALOG_SCREEEN: PackedScene =  preload("res://Scenes/dialogo_secre.tscn")

# Dicionários de diálogos
var dialogErro1: Dictionary = {
	0: {"dialog": "Não tá certo... Mas tem um pouco de verdade. De qualquer forma, você está errada, tente novamente…", "title": "kuko-cola"}
}

var dialogErro2: Dictionary = {
	0: {"dialog": "Você errou, MELHORE!", "title": "Trela-vita"}
}

var dialogErro3: Dictionary = {
	0: {"dialog": "Nossa... Que pena... Você tinha potêncial...", "title": "Appear"}
}

var dialogErro4: Dictionary = {
	0: {"dialog": "Acho que erramos", "title": "Tereza"}
}

var dialogCorretor1: Dictionary = {
	0: {"dialog": "Parabéns, Tereza você realmente é inteligente, ", "title": "kuko-cola"},
	1: {"dialog": "Mas você terá que passar pelos outros colaboradores. Vá e tente mudar o mundo", "title": "kuko-cola"},
	2: {"dialog": "Ok, até mais!", "title": "Tereza"}
}

var dialogCorretor2: Dictionary = {
	0: {"dialog": "Muito bem, resposta correta! Você pode passar para a próxima fase", "title": "Trela-vita"},
	1: {"dialog": "Obrigado", "title": "Tereza"}
}

var dialogCorretor3: Dictionary = {
	0: {"dialog": "Correto... E agora... Você enfrentará o MAIS difícil...", "title": "Appear"},
	1: {"dialog": "???", "title": "Tereza"}
}

var dialogCorretor4: Dictionary = {
	0: {"dialog": "Acertei! Foi tão fácil!", "title": "Tereza"},
	1: {"dialog": "Pensndo bem... Eu não sabia que a minha ganância iria levar a humanidade à ruínas…", "title": "Maxsoft"},
	2: {"dialog": "Não é o dinheiro, sucesso ou bens materiais que vão fazer você feliz e completo... Às vezes, as coisas mais simples trazem felicidade.", "title": "Tereza"},
	3: {"dialog": "Vamos salvar o planeta juntos, tá?", "title": "Tereza"}
}

# Função para carregar o diálogo
func load_dialog(dialogs: Dictionary, index: int) -> void:
	if dialogs.has(index):
		var dialog_data = dialogs[index]
		print("Título: %s" % dialog_data["title"])
		print("Diálogo: %s" % dialog_data["dialog"])
	else:
		print("Diálogo não encontrado para o índice %d" % index)

# Função de processar as alternativas
func _process(delta: float) -> void:
	if Glogal.AlternativaChef == "chef1":
		button_1.text = "Não afeta, eles morrem por predadores"
		button_2.text = "Morrem com o lixo no mar"
		load_dialog(dialogCorretor1, 0)
		
	elif Glogal.AlternativaChef == "chef2":
		button_1.text = "Não, porque o lixo se decompõem rapidamente."
		button_2.text = "Sim, porque o lixo leva ao entupimento nos bueiros."
		load_dialog(dialogCorretor2, 0)
		
	elif Glogal.AlternativaChef == "chef3":
		button_1.text = "Indústria alimentícia?"
		button_2.text = "Indústria petrolífera?"
		load_dialog(dialogCorretor3, 0)
		
	elif Glogal.AlternativaChef == "chef4":
		button_1.text = "Recusar, racionalizar e receber."
		button_2.text = "Reduzir, reciclar e reutilizar."
		load_dialog(dialogCorretor4, 0)

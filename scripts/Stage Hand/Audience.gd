extends Node2D

@export var AudienceMember: Texture2D
@export var Coin: Resource
@export var Ground: Sprite2D#Resource

@onready var Group = $Group

func _ready() -> void:
	var audienceAmount = randi_range(15, 20)
	for i in range(audienceAmount):
		var member = Sprite2D.new()
		member.texture = load("res://assets/icon.svg")
		var xPos = (get_viewport().size.x / audienceAmount) * i + randi_range(-20, 20)
		member.global_position = Vector2(xPos, position.y + randi_range(-30, 30))
		Group.add_child(member)
	ThrowCoins(5)

func ThrowCoins(amount: int) -> void:
	for i in range(amount):
		var x = randf_range(15, 20)
		SpawnCoin(Vector2(x, Ground.position.y)) # get ground y position
	
func SpawnCoin(pos: Vector2) -> void:
	var coin = Coin.instantiate()
	coin.global_position = pos
	add_child(coin)

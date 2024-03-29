extends Node2D

const GrassEffect = preload("res://Effects/GrassEffect.tscn")

func create_grass_effect() -> void:
	var grassEffect = GrassEffect.instance()
	get_parent().add_child(grassEffect)
	grassEffect.global_position = global_position

func _on_Hurtbox_area_entered(area: Area2D) -> void:
	create_grass_effect()
	queue_free()

extends Area2D

const HitEffect = preload("res://Effects/HitEffect.tscn")

var invisible = false setget set_invisible

onready var timer = $Timer

signal invicibility_started
signal invicibility_ended

func set_invisible(value: bool) -> void:
	invisible = value
	if invisible == true:
		emit_signal("invicibility_started")
	else:
		emit_signal("invicibility_ended")

func start_invicibility(duration):
	self.invisible = true
	timer.start(duration)

func create_hit_effect() -> void:
	var effect = HitEffect.instance()
	var main = get_tree().current_scene
	main.add_child(effect)
	effect.global_position = global_position

func _on_Timer_timeout() -> void:
	self.invisible = false

func _on_Hurtbox_invicibility_started() -> void:
	set_deferred("monitorable", false)

func _on_Hurtbox_invicibility_ended() -> void:
	monitorable = true

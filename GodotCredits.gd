extends Node2D

const section_time := 3.0
const line_time := 0.5
const base_speed := 60
const speed_up_multiplier := 5.0
const title_color := Color.red

var scroll_speed := base_speed
var speed_up := false

onready var line := $CreditsContainer/Line
var started := false
var finished := false

var section
var section_next := true
var section_timer := 0.0
var line_timer := 0.0
var curr_line := 0
var lines := []

var credits = [
	[
		"A game by Devinap",
		"Sebastian Alfaro H.",
		"Ariel Nunez Lobos",
		"Diego Sandoval L."
	],[
		"Programming",
		"Sebastian Alfaro H.",
		"Ariel Nunez Lobos",
		"Diego Sandoval L."
	],[
		"Art",
		"Diego Sandoval L.",
		"Robot w/ gun by alisdaiross",
		"Medieval Fantasy Characters Pack by CleanCutGames",
		"Warped City by ansimuz",
		"Cyberpunk City Art - Jonas Roscinas",
		"Sideview Sci-Fi - Patreon Collection",
		"Neonglow by Josef Bartoñ",
		"(Permitted to use by the author",
		"from https://www.artstation.com/artwork/rR0XYJ)"
	],[
		"Music",
		"AeronMusic - Infinite",
		"AeronMusic - Appear",
		"AeronMusic - Bloodmoon",
		"yunkbeatsaek - OST",
		"Diossel - Sunflower",
		"B0nn0t - Riot Ribs"
	],[
		"Sound Effects",
		"opengameart.org",
		"dklon",
		"remaxim",
		"Michel"
	],[
		"Tools used",
		"Developed with Godot Engine",
		"https://godotengine.org/license",
		"",
		"Art created with paint.net",
		"www.getpaint.net",
		"",
		"Art and designs created with Adobe Photoshop",
		"https://www.adobe.com/products/photoshop.html"
	],[
		"Special thanks",
		"Our friends",
		"CC5408",
		"Elias Zelada for guiding and help"
	],[
		"And you",
	]
]

func _ready():
	Globals.KillProps()
func _process(delta):
	var scroll_speed = base_speed * delta
	
	if section_next:
		section_timer += delta * speed_up_multiplier if speed_up else delta
		if section_timer >= section_time:
			section_timer -= section_time
			
			if credits.size() > 0:
				started = true
				section = credits.pop_front()
				curr_line = 0
				add_line()
	
	else:
		line_timer += delta * speed_up_multiplier if speed_up else delta
		if line_timer >= line_time:
			line_timer -= line_time
			add_line()
	
	if speed_up:
		scroll_speed *= speed_up_multiplier
	
	if lines.size() > 0:
		for l in lines:
			l.rect_position.y -= scroll_speed
			if l.rect_position.y < -l.get_line_height():
				lines.erase(l)
				l.queue_free()
	elif started:
		finish()


func finish():
	if not finished:
		finished = true
		yield(get_tree().create_timer(5), "timeout")
		# NOTE: This is called when the credits finish
		# - Hook up your code to return to the relevant scene here, eg...
		get_tree().change_scene("res://Titlescreen.tscn")


func add_line():
	var new_line = line.duplicate()
	new_line.text = section.pop_front()
	lines.append(new_line)
	if curr_line == 0:
		new_line.add_color_override("font_color", title_color)
	$CreditsContainer.add_child(new_line)
	
	if section.size() > 0:
		curr_line += 1
		section_next = false
	else:
		section_next = true


func _unhandled_input(event):
	if event.is_action_pressed("ui_cancel") or event.is_action("Pause"):
		finish()
	if event.is_action_pressed("ui_down") and !event.is_echo():
		speed_up = true
	if event.is_action_released("ui_down") and !event.is_echo():
		speed_up = false
		
		
func _physics_process(delta):
	$ParallaxBackground/ParallaxLayer.motion_offset.y += 0.0015*scroll_speed


func _on_TextureButton_pressed():
	get_tree().change_scene("res://Titlescreen.tscn")

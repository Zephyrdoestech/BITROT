extends CanvasLayer

var selected: int = 0
var options: Array = ["Option 1", "Option 2", "Option 3"]

func _ready() -> void:
	visible = false
	process_mode = Node.PROCESS_MODE_ALWAYS  # runs even while paused

func open(incoming_options: Array) -> void:
	options = incoming_options
	visible = true
	selected = 0
	update_labels()
	update_cursor()

func update_labels() -> void:
	var option_nodes = $Control/Panel/VBoxContainer.get_children()
	for i in option_nodes.size():
		option_nodes[i].text = options[i]



func close() -> void:
	visible = false
	GameManager.resume_game()

func _process(_delta) -> void:
	if not visible:
		return

	if Input.is_action_just_pressed("up"):
		selected = max(0, selected - 1)
		update_cursor()

	if Input.is_action_just_pressed("down"):
		selected = min(options.size() - 1, selected + 1)
		update_cursor()

	if Input.is_action_just_pressed("ui_accept"):
		choose_option(selected)

func update_cursor() -> void:
	var option_nodes = $Control/Panel/VBoxContainer.get_children()
	for i in option_nodes.size():
		option_nodes[i].add_theme_color_override("font_color",
			Color.WHITE if i == selected else Color(0.5, 0.5, 0.5))

func choose_option(index: int) -> void:
	match index:
		0:
			print("chose option 1")
			# do something
		1:
			print("chose option 2")
			# do something
		2:
			print("chose option 3")
			# do something
	close()

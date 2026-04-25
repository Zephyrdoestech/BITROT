extends CanvasLayer

signal option_selected(index: int, is_toggled: bool)

var options_default: Array = []   # original labels
var options_toggled: Array = []   # opposite labels
var toggled: Array = [false, false, false]  # current state per option
var selected: int = 0

func _ready() -> void:
	visible = false
	process_mode = Node.PROCESS_MODE_ALWAYS

func open(defaults: Array, opposites: Array) -> void:
	options_default = defaults
	options_toggled = opposites
	visible = true
	selected = 0
	update_labels()
	update_cursor()

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
		selected = min(2, selected + 1)
		update_cursor()

	if Input.is_action_just_pressed("accept"):
		choose_option(selected)

func choose_option(index: int) -> void:
	# flip the toggle state for that option only
	toggled[index] = !toggled[index]
	update_labels()
	update_cursor()
	emit_signal("option_selected", index, toggled[index])
	close()

func update_labels() -> void:
	var option_nodes = $Control/Panel/VBoxContainer.get_children()
	for i in option_nodes.size():
		# show toggled label if active, default if not
		option_nodes[i].text = options_toggled[i] if toggled[i] else options_default[i]

func update_cursor() -> void:
	var option_nodes = $Control/Panel/VBoxContainer.get_children()
	for i in option_nodes.size():
		option_nodes[i].add_theme_color_override("font_color",
			Color.WHITE if i == selected else Color(0.5, 0.5, 0.5))

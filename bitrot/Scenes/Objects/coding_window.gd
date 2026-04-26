extends CanvasLayer

signal option_selected(bubble_id: int, index: int, is_toggled: bool)

var all_toggled: Dictionary = {}
var options_default: Array = []   # original labels
var options_toggled: Array = []   # opposite labels
var toggled: Array = [false, false, false]  # current state per option
var selected: int = 0
var blocked_indices: Array = []

func _ready() -> void:
	visible = false
	process_mode = Node.PROCESS_MODE_ALWAYS

func open(id: int, defaults: Array, opposites: Array) -> void:
	current_bubble_id = id
	options_default = defaults
	options_toggled = opposites
	# load this bubble's saved state, or default to all false
	if not all_toggled.has(id):
		all_toggled[id] = [false, false, false]
	toggled = all_toggled[id]
	visible = true
	selected = 0
	update_labels()
	update_cursor()

var current_bubble_id: int = 0

func choose_option(index: int) -> void:
	if index in blocked_indices:
		# show popup WITHOUT closing or toggling
		$BlockedPopup.visible = true
		$Control.visible = false
		return  # stop here, don't toggle, don't emit, don't close
	toggled[index] = !toggled[index]
	all_toggled[current_bubble_id] = toggled
	update_labels()
	update_cursor()
	emit_signal("option_selected", current_bubble_id, index, toggled[index])
	close()

func close() -> void:
	visible = false
	GameManager.resume_game()

func _process(_delta) -> void:
	if not visible:
		return
		
		
	if $BlockedPopup.visible:
		if Input.is_action_just_pressed("ui_accept") or Input.is_action_just_pressed("interact"):
			$BlockedPopup.visible = false
			$Control.visible = true
		return  

	if Input.is_action_just_pressed("up"):
		selected = max(0, selected - 1)
		update_cursor()

	if Input.is_action_just_pressed("down"):
		selected = min(2, selected + 1)
		update_cursor()

	if Input.is_action_just_pressed("accept"):
		choose_option(selected)

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

func show_blocked() -> void:
	$BlockedPopup.visible = true
	$Control.visible = false  # hide options behind it

func reset() -> void:
	all_toggled = {}
	toggled = [false, false, false]
	blocked_indices = []
	visible = false

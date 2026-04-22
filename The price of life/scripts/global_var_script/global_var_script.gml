function save_data() {
	var data_struct =  {"lvl_hp":			global.lvl_hp,
						"lvl_damage":		global.lvl_damage,
						"lvl_max_energy":	global.lvl_max_energy,
						"lvl_energy_recup": global.lvl_energy_recup,
						"xp":				global.xp,
						"show_intro":		global.show_intro,
						"volume":			global.volume}
	var json_string = json_stringify(data_struct)
	var file = file_text_open_write("save.json")
	file_text_write_string(file, json_string)
	file_text_close(file)
}

function load_data() {
	if file_exists("save.json") {
		var file = file_text_open_read("save.json")
		var json_string = file_text_read_string(file)
		file_text_close(file)
		var data_struct = json_parse(json_string)
		
		global.lvl_hp = data_struct[$ "lvl_hp"]
		global.lvl_damage = data_struct[$ "lvl_damage"]
		global.lvl_max_energy = data_struct[$ "lvl_max_energy"]
		global.lvl_energy_recup = data_struct[$ "lvl_energy_recup"]
		global.xp = data_struct[$ "xp"]
		global.show_intro = data_struct[$ "show_intro"]
		global.volume = data_struct[$ "volume"]
	} else {
		global.lvl_hp = 0
		global.lvl_damage = 0
		global.lvl_max_energy = 0
		global.lvl_energy_recup = 0
		global.xp = 0
		global.show_intro = true
		global.volume = 1
	}
}

function reset_data() {
	global.lvl_hp = 0
	global.lvl_damage = 0
	global.lvl_max_energy = 0
	global.lvl_energy_recup = 0
	global.xp = 0
	global.show_intro = true
	global.volume = 1
}

load_data()
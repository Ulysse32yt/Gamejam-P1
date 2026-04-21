var _gui_mx = device_mouse_x_to_gui(0)
var _gui_my = device_mouse_y_to_gui(0)
var _gui_w  = display_get_gui_width()
var _gui_h  = display_get_gui_height()
var _shop   = shop_manager_obj
var _xp     = xp_obj

var _card_w = 250
var _card_h = 160
var _gap    = 30
var _total  = (_card_w * 4) + (_gap * 3)
var _start_x = (_gui_w - _total) / 2
var _y = _gui_h / 2 - _card_h / 2

for (var i = 0; i < 4; i++) {
    var _x = _start_x + i * (_card_w + _gap)
    
    if point_in_rectangle(_gui_mx, _gui_my, _x, _y, _x + _card_w, _y + _card_h) {
        var _lvls = [_shop.lvl_lifetime, _shop.lvl_damage, _shop.lvl_max_energy, _shop.lvl_energy_recup]
        var _cost = _shop.get_cost(_lvls[i])
        
        if (_xp.xp >= _cost) {
            _xp.xp -= _cost
            
            switch(i) {
                case 0: _shop.lvl_lifetime++;    break
                case 1: _shop.lvl_damage++;      break
                case 2: _shop.lvl_max_energy++;  break
                case 3: _shop.lvl_energy_recup++; break
            }
        }
    }
}
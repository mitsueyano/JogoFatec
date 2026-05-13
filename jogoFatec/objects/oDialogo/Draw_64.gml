var _guil = display_get_gui_width();
var _guia = display_get_gui_height();

var _xx = 0;
var _yy = _guia - 200;
var _c = c_black;

var _nome_atual   = textos_grid[# Infos.Quem, pagina];
var _txt_completo = textos_grid[# Infos.Texto, pagina];
var _texto_animado = string_copy(_txt_completo, 1, caractere);

// Cores dos personagens
var _cor_nome = c_white;

switch(_nome_atual) {
    case "Player": 
        _cor_nome = c_aqua; 
        break;
    default:
        _cor_nome = c_yellow; 
        break;
}


draw_set_font(fnt_dialogo);

// Caixa
draw_rectangle_color(_xx, _yy, _guil, _guia, _c, _c, _c, _c, false);

// Nome
draw_set_color(_cor_nome);
draw_text(_xx + 32, _yy + 10, _nome_atual);

//Texto
draw_set_color(c_white);
draw_text_ext(_xx + 32, _yy + 60, _texto_animado, 32, _guil - 64);
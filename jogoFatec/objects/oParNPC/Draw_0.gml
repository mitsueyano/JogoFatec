draw_self();

// Checa a distância do player
if (distance_to_object(oPlayer) <= 30) {
    if (global.dialogo == false) {
        
        // Configurações de estilo
        draw_set_halign(fa_middle);
        draw_set_valign(fa_middle);

        var _flutuar = sin(current_time / 300) * 3;
        var _xx = x;
        var _yy = y - sprite_height + 5 + _flutuar; // 10px acima da cabeça
        
        // "E"
		draw_set_font(fnt_btn_NPC)
        draw_set_color(c_white);
        draw_text(_xx, _yy, "E");
        
        // Reset
        draw_set_alpha(1);
        draw_set_halign(fa_left);
        draw_set_valign(fa_top);
    }
}
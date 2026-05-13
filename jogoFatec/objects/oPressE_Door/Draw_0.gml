if (!instance_exists(dono)) {
    instance_destroy();
    exit;
}

draw_set_font(fnt_btn_Door)
draw_set_halign(fa_middle);
draw_set_valign(fa_middle);

var texto = "E";
var largura = 20;
var altura = 20;
var pos_x = dono.x + 30;
var pos_y = dono.y;

var alpha = 0.8 + 0.2 * sin(current_time / 420);

draw_set_color(#1F1F1F);
draw_set_alpha(alpha);
draw_roundrect(pos_x - largura/2, pos_y - altura/2, pos_x + largura/2, pos_y + altura/2, false);

draw_set_color(c_white);
draw_set_alpha(1);
draw_roundrect(pos_x - largura/2, pos_y - altura/2, pos_x + largura/2, pos_y + altura/2, true);

draw_set_color(c_white);
draw_set_alpha(alpha);
draw_text(pos_x + 1, pos_y - 1, texto);

// Reset
draw_set_alpha(1);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
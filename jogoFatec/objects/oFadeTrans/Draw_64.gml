// --- 1. PARTE DO DESENHO ---
draw_set_alpha(alpha); // Define a transparência atual (começa em 0)
draw_set_color(c_black);

draw_rectangle(0, 0, display_get_gui_width(), display_get_gui_height(), false);

// reseta o alpha e a cor para não afetar o resto do jogo
draw_set_alpha(1);
draw_set_color(c_white);


alpha += (fade_speed * fade_state); 


// Escurecendo
if (alpha >= 1) {
    alpha = 1;        
    fade_state = -1;  // iNVERTE
    
    global.escuro = true; 
}


// Clareando
if (alpha <= 0 && fade_state == -1) {
    alpha = 0;  
    instance_destroy();
}
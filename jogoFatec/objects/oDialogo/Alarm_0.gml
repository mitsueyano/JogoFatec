if (inicializar == true) {
	var _texto_completo = textos_grid[# Infos.Texto, pagina];
    
    if (caractere < string_length(textos_grid[# Infos.Texto, pagina])) {
        if (!audio_is_playing(dialog)) {
            audio_play_sound(dialog, 1, false);
        }
        
        caractere++;
        alarm[0] = 1; // Velocidade da escrita
    } else {
        audio_stop_sound(dialog);
    }
}
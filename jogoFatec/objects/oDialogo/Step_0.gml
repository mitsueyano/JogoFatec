if (incializar == false){
	scr_textos();
	incializar = true;
}

if (mouse_check_button_pressed(mb_left)){
	if caractere < string_length(texto[pagina]){
		caractere = string_length(texto[pagina]);
	}else{
		alarm[0] = 1;
		caractere = 0
		if (pagina < array_length(texto) - 1 ){
			pagina++;
		} else {
			global.dialogo = false;
			instance_destroy();
		}
	}
}
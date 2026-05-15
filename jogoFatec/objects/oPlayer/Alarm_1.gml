// Delay de 1seg

switch (global.cutscene_fase){

	// ---------- CUTSCENE SECRETARIA
	//enquanto lê a senha do wifi
	case "Secretaria": 
		dialogo("connWifi");
		global.cutscene_subfase = "esperando_wifi";
		global.cutscene_rodou = false;
	break
	
	//---------- CUTSCENE CELULAR
	//Recebendo notificações
	case "Celular":
		switch (global.cutscene_subfase){
			case "inicio":
				audio_play_sound(new_message, 1, false);
				global.cutscene_subfase = "pos_notificacao";
				global.cutscene_rodou = false;
			break;
			
			case "pos_notificacao":
				dialogo("notificacao1");
				global.cutscene_subfase = "fade_celular";
				global.cutscene_rodou = false;
			break;
		}
	break;

	
	default: break;
}
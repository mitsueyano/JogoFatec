function scr_mudar_tela_celular(){
	
	switch (global.msg){
		case 1:
			oCelular.sprite_index = bgCelular_2
			audio_play_sound(received, 1, false);
			global.msg++
		break;
	
		case 2:
			oCelular.sprite_index = bgCelular_3
			audio_play_sound(received, 1, false);
			global.msg++
		break;
	
		case 3:
			oCelular.sprite_index = bgCelular_4
			audio_play_sound(received, 1, false);
			global.msg++			
		break;
		
		case 4:
			oCelular.sprite_index = bgCelular_5
			audio_play_sound(click, 1, false);
			global.msg++
		break;
		
		case 5:
			oCelular.sprite_index = bgCelular_6
			audio_play_sound(error, 1, false);
			global.msg++
		break;
	
		default: 
			global.cutscene_subfase = "reacao_celular"				
			global.cutscene_rodou = false;
		break;
	}

}
function cutscene_celular(){
	switch(global.cutscene_subfase){
		
		case "inicio":
			if (!global.cutscene_rodou){
				oPlayer.alarm[1] = room_speed * 1;
				global.cutscene_rodou = true;
			}
		break;
		
		case "pos_notificacao":
			if (!global.cutscene_rodou){
				oPlayer.alarm[1] = room_speed * 1;
				global.cutscene_rodou = true;
			}		
		break;
		
		// Faz o fade
		case "fade_in_celular":
			if (!global.dialogo and !global.cutscene_rodou){
				var _ts = time_source_create(time_source_game, 1, time_source_units_seconds, function() {
				    instance_create_depth(0, 0, -9999, oFadeTrans)				
			    });

		        time_source_start(_ts);
				global.cutscene_rodou = true;
			
			}
			
			// Cria o celular e conclui
			if (instance_exists(oFadeTrans)) {
				if (global.escuro and !instance_exists(oCelular)) {  
				    instance_create_depth(0, 0, -8000, oCelular);
					global.escuro = false;
					global.cutscene_subfase = "msg_celular";
					global.cutscene_rodou = false;
				}
			}
		break;
		
		case "msg_celular":
			if (!global.cutscene_rodou){
				var _ts1 = time_source_create(time_source_game, 1, time_source_units_seconds, scr_mudar_tela_celular);
				var _ts2 = time_source_create(time_source_game, 3, time_source_units_seconds, scr_mudar_tela_celular);
				var _ts3 = time_source_create(time_source_game, 5, time_source_units_seconds, scr_mudar_tela_celular);
				var _ts4 = time_source_create(time_source_game, 7, time_source_units_seconds, scr_mudar_tela_celular);
				var _ts5 = time_source_create(time_source_game, 9, time_source_units_seconds, scr_mudar_tela_celular);
				var _ts6 = time_source_create(time_source_game, 11, time_source_units_seconds, scr_mudar_tela_celular);
				
		        time_source_start(_ts1);
				time_source_start(_ts2);
				time_source_start(_ts3);
				time_source_start(_ts4);
				time_source_start(_ts5);
				time_source_start(_ts6);
				
				global.cutscene_rodou = true
			}
		break;
		
		case "reacao_celular":
                    if (!global.cutscene_rodou and !global.dialogo){				
                        dialogo("screen_error");
                        global.cutscene_subfase = "fade_out_celular";
                    }
                break;
        
        case "fade_out_celular":
            if (!global.dialogo and !global.cutscene_rodou){
                var _ts = time_source_create(time_source_game, 1, time_source_units_seconds, function() {
                    instance_create_depth(0, 0, -9999, oFadeTrans)    
                });
                time_source_start(_ts);
                global.cutscene_rodou = true;
            }
            
            if (global.escuro){
                instance_destroy(oCelular);     
                
                var _ts = time_source_create(time_source_game, 2, time_source_units_seconds, function() {
                    dialogo("campus_vazio_reacao");
                    global.cutscene_rodou = false;
                    global.cutscene = false
                    global.cutscene_fase = "Cesar";
                    global.cutscene_subfase = "inicio";
                });
                time_source_start(_ts);
                global.cutscene_subfase = "esperando_reacao";
            }
        break;
		
		default: break;
	}
}
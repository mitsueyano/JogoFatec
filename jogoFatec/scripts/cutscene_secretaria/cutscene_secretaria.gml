function cutscene_secretaria(){
    switch (global.cutscene_subfase) {
        case "inicio":
            if (!global.cutscene_rodou){
                /*
                oPlayer.alarm[0] = room_speed * 2;
                global.cutscene_rodou = true;
                 * */
                global.cutscene_fase = "Celular"
                global.cutscene_subfase = "fade_out_celular"
            }
        break;
        
        case "timer_rodou":
            if (!global.dialogo) {
                global.cutscene_subfase = "andando";
            }
        break;
        
        case "andando":
            if (!global.dialogo) {
                var _targetX = 306;
                var _targetY = 79;
                var _vel = 0.5;
                if (point_distance(oPlayer.x, oPlayer.y, _targetX, _targetY) > _vel) {
                    mp_linear_step(_targetX, _targetY, _vel, false);
                    oPlayer.sprite_index = sPlayer_side;
                    oPlayer.image_speed = 1;
                    oPlayer.image_xscale = (_targetX > oPlayer.x) ? 1 : -1;
                } else {
                    oPlayer.x = _targetX;
                    oPlayer.y = _targetY;
                    oPlayer.sprite_index = sPlayer_idleBack;
                    if (!global.cutscene_rodou){
                        oPlayer.alarm[1] = room_speed * 1;
                        global.cutscene_rodou = true;
                    }
                }
            }
        break;
        
        case "connWifi":
            if (!global.dialogo and !global.cutscene_rodou) {
                var _ts = time_source_create(time_source_game, 1, time_source_units_seconds, function() {
                    audio_play_sound(connect, 1, false);
                    global.cutscene_fase = "Celular";
                    global.cutscene_subfase = "inicio";
                    global.cutscene_rodou = false;
                });
                time_source_start(_ts);
                global.cutscene_rodou = true;
            }
        break;
    }
}
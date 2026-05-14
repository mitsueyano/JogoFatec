if (global.InteracaoSecretaria == true) {
    global.cutscene = true;
    if (global.dialogo == false) {
        var _xNPC = 490;
        var _yNPC = 124;
        var _vel = 0.5;
        if (point_distance(x, y, _xNPC, _yNPC) > _vel) {
            mp_linear_step(_xNPC, _yNPC, _vel, false);
            sprite_index = sSecretariaWalk;
            image_xscale = (_xNPC > x) ? 1 : -1;
        } else {
			// Timer
			var _ts = time_source_create(time_source_game, 2, time_source_units_seconds, function() {
			    falas_solo("pensamento_pos_secretaria"); // Oq faz depois de 2seg
			});
    
			time_source_start(_ts);
            oPlayer.cutscene_fase = 1;
            instance_destroy();
        }
    }
}
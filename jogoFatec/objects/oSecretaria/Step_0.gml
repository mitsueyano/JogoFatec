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
            global.cutscene_fase = "Secretaria";
			global.cutscene_subfase = "inicio";
            instance_destroy();
        }
    }
}
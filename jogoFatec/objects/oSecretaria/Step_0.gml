if (global.InteracaoSecretaria == true) {
    if (global.dialogo == false) {
        
        var _distancia = point_distance(x, y, 490, 124); // Onde o NPC vai
        var _vel = 0.5;

        if (_distancia > _vel) {
            mp_linear_step(490, 124, _vel, false);
            
            sprite_index = sSecretariaWalk;           
            if (490 > x) image_xscale = 1; else image_xscale = -1; // Direção do sprite
        } else { // Quando chega nas coordenadas
            instance_destroy()
        }
    } else {
        speed = 0;
    }
}
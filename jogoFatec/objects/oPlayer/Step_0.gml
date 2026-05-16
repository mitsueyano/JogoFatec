// Perto de NPCs
if (distance_to_object(oParNPC) <= 30) {
    if (keyboard_check_pressed(ord("E")) and global.dialogo == false) {
        var _npc = instance_nearest(x, y, oParNPC);
        var _dialogo = instance_create_layer(x, y, "Dialogo", oDialogo);
        _dialogo.npc_nome = _npc.nome;
    }
}

global.dialogo = instance_exists(oDialogo);

// Chama a cutscene
if (global.cutscene == true) {
   scr_cutscenes(global.cutscene_fase)
}


// Colisão - Empurra 1 px pro lado - Correção de ficar paralisado na parede
if (place_meeting(x, y, oCollision)) {
    while (place_meeting(x, y, oCollision)) {
        if (!place_meeting(x, y - 1, oCollision)) { y -= 1; break; }
        if (!place_meeting(x, y + 1, oCollision)) { y += 1; break; }
        if (!place_meeting(x - 1, y, oCollision)) { x -= 1; break; }
        if (!place_meeting(x + 1, y, oCollision)) { x += 1; break; }
        break;
    }
}

// Movimentação Manual
if (!global.dialogo && !global.cutscene) {
    var _input_x = (keyboard_check(vk_right) || keyboard_check(ord("D"))) - (keyboard_check(vk_left) || keyboard_check(ord("A")));
    var _input_y = (keyboard_check(vk_down) || keyboard_check(ord("S"))) - (keyboard_check(vk_up) || keyboard_check(ord("W")));
    
    if (_input_x != 0 || _input_y != 0) {
        //Horizontal
        if (!place_meeting(x + _input_x * spd, y, oCollision)) {
            x += _input_x * spd;
        } else {
            while (!place_meeting(x + sign(_input_x), y, oCollision)) x += sign(_input_x);
        }
        
        //Vertical
        if (!place_meeting(x, y + _input_y * spd, oCollision)) {
            y += _input_y * spd;
        } else {
            while (!place_meeting(x, y + sign(_input_y), oCollision)) y += sign(_input_y);
        }
        
        if (_input_x != 0 && _input_y != 0) {
            //Diagonal
            if (_input_y > 0) {
                sprite_index = sPlayerDiagonalFront; // Diagonal para Baixo
            } else {
                sprite_index = Sprite53;  // Diagonal para Cima
            }
        } else {
            if (_input_y > 0) {
                sprite_index = sPlayerFront; //Baixo
            } else if (_input_y < 0) {
                sprite_index = sPlayerBack;  //Cima
            } else if (_input_x != 0) {
                sprite_index = sPlayerSide;  //Lados
            }
        }
        
        //Inversão de lados
        if (_input_x != 0) {
            image_xscale = sign(_input_x);
        }
        
    } else {
        sprite_index = sPlayerIdle;
    }
} else {
    if (!global.cutscene){
        sprite_index = sPlayerIdle;
    }
}
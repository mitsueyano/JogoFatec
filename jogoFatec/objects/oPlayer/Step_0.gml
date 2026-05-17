// Perto de NPCs
if (distance_to_object(oParNPC) <= 30) {
    if (keyboard_check_pressed(ord("E")) and global.dialogo == false) {
        var _npc = instance_nearest(x, y, oParNPC);
        var _dialogo = instance_create_layer(x, y, "Dialogo", oDialogo);
        _dialogo.npc_nome = _npc.nome;
    }
}

global.dialogo = instance_exists(oDialogo);

// Chama as cutscenes dependendo da fase que está
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
        
        // Normaliza a velocidade para a diagonal
        var _dir = point_direction(0, 0, _input_x, _input_y);
        var _hspd = lengthdir_x(spd, _dir);
        var _vspd = lengthdir_y(spd, _dir);
        
        // Horizontal
        if (!place_meeting(x + _hspd, y, oCollision)) {
            x += _hspd;
        } else {
            while (!place_meeting(x + sign(_hspd), y, oCollision)) x += sign(_hspd);
        }
        
        // Vertical
        if (!place_meeting(x, y + _vspd, oCollision)) {
            y += _vspd;
        } else {
            while (!place_meeting(x, y + sign(_vspd), oCollision)) y += sign(_vspd);
        }
        
        // Definição dos Sprites
        if (_input_y > 0) {
            sprite_index = sPlayer_front; // Baixo
        } else if (_input_y < 0) {
            sprite_index = sPlayer_back;  // Cima
        } else if (_input_x != 0) {
            sprite_index = sPlayer_side;  // Lados
        }
        
        // Inversão de lados
        if (_input_x != 0) {
            image_xscale = sign(_input_x);
        }
        
    } else {
        sprite_index = sPlayer_idle;
    }
} else {
    if (!global.cutscene){
        sprite_index = sPlayer_idle;
    }
}
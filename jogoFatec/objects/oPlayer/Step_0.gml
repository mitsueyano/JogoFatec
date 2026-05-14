// Perto de NPCs
if (distance_to_object(oParNPC) <= 30) {
    if (keyboard_check_pressed(ord("E")) and global.dialogo == false) {
        var _npc = instance_nearest(x, y, oParNPC);
        var _dialogo = instance_create_layer(x, y, "Dialogo", oDialogo);
        _dialogo.npc_nome = _npc.nome;
    }
}

global.dialogo = instance_exists(oDialogo);

// Cutscene inicial
if (global.cutscene == true) {

    if (cutscene_fase == 0) {
        // Aguarda a secretaria sumir antes de fazer qualquer coisa
        sprite_index = sPlayer;
        exit;
    }
    
    if (cutscene_fase == 1) {
        sprite_index = sPlayer;
        if (global.dialogo == true) {
            cutscene_dialogo_iniciado = true;
        }
        if (cutscene_dialogo_iniciado == true && global.dialogo == false) {
            cutscene_fase = 2;
            cutscene_dialogo_iniciado = false;
        }
        exit;
    }
    
    if (cutscene_fase == 2) {
        if (global.dialogo == false) {
            var _targetX = 306;
            var _targetY = 79;
            var _vel = 0.5;
            if (point_distance(x, y, _targetX, _targetY) > _vel) {
                mp_linear_step(_targetX, _targetY, _vel, false);
                sprite_index = sPlayerWalk;
                image_xscale = (_targetX > x) ? 1 : -1;
                exit;
            } else {
                x = _targetX;
                y = _targetY;
                sprite_index = sPlayer;
				
			    var _ts = time_source_create(time_source_game, 1, time_source_units_seconds, function() {
					falas_solo("connWifi"); // Oq faz depois do Timer			
				    global.cutscene = false;

			    });
			    time_source_start(_ts);
				cutscene_fase = 0;	
              
            }
        } else {
            sprite_index = sPlayer;
            exit;
        }
    }
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
        if (!place_meeting(x + _input_x * spd, y, oCollision)) {
            x += _input_x * spd;
        } else {
            while (!place_meeting(x + sign(_input_x), y, oCollision)) x += sign(_input_x);
        }
        if (!place_meeting(x, y + _input_y * spd, oCollision)) {
            y += _input_y * spd;
        } else {
            while (!place_meeting(x, y + sign(_input_y), oCollision)) y += sign(_input_y);
        }
        sprite_index = sPlayerWalk;
        if (_input_x != 0) image_xscale = sign(_input_x);
    } else {
        sprite_index = sPlayer;
    }
} else {
    sprite_index = sPlayer;
}
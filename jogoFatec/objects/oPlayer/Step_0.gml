// Perto de NPCS
if distance_to_object(oParNPC) <= 30{
	if (keyboard_check_pressed(ord("E")) and global.dialogo == false){
		var _npc = instance_nearest(x, y, oParNPC)
		var _dialogo = instance_create_layer(x, y, "Dialogo", oDialogo)
		_dialogo.npc_nome = _npc.nome
	}
}
if instance_exists(oDialogo){
	global.dialogo = true;		
}	


// ----Colisão

// Empurra o player para fora da parede caso esteja dentro dela -- correção do erro de paralisar na parede
while (place_meeting(x, y, oCollision)) {
    // descobre de qual lado veio e empurra 1px pra fora
    if (!place_meeting(x, y - 1, oCollision)) { y -= 1; break; }
    if (!place_meeting(x, y + 1, oCollision)) { y += 1; break; }
    if (!place_meeting(x - 1, y, oCollision)) { x -= 1; break; }
    if (!place_meeting(x + 1, y, oCollision)) { x += 1; break; }
    break;
}

// ----Movimentação
if (global.dialogo == false) {
	var _input_x = 0;
	var _input_y = 0;

	if (keyboard_check(vk_right) or keyboard_check(ord("D"))) { _input_x = spd; }
	if (keyboard_check(vk_left)  or keyboard_check(ord("A"))) { _input_x = -spd; }
	if (keyboard_check(vk_down)  or keyboard_check(ord("S"))) { _input_y = spd; }
	if (keyboard_check(vk_up)    or keyboard_check(ord("W"))) { _input_y = -spd; }

	// Eixo X
	if (_input_x != 0) {
	    if (!place_meeting(x + _input_x, y, oCollision)) {
	        x += _input_x;
	    } else {
	        while (!place_meeting(x + sign(_input_x), y, oCollision)) {
	            x += sign(_input_x);
	        }
	    }
	    image_xscale = sign(_input_x);
	}

	// Eixo Y
	if (_input_y != 0) {
	    if (!place_meeting(x, y + _input_y, oCollision)) {
	        y += _input_y;
	    } else {
	        while (!place_meeting(x, y + sign(_input_y), oCollision)) {
	            y += sign(_input_y);
	        }
	    }
	}

	// Animação de andar
	if (_input_x != 0 or _input_y != 0) {
	    sprite_index = sPlayerWalk;
	} else {
	    sprite_index = sPlayer;
	}	
} else {
    sprite_index = sPlayer;
}
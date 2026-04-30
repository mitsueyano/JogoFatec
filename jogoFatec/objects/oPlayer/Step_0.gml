// Movimentação e colisão
// Cima

if (keyboard_check(vk_up) or keyboard_check(ord("W"))) {
    if (!place_meeting(x, y - spd, oCollision)) {
        y -= spd;
    }
}

// Baixo
if (keyboard_check(vk_down) or keyboard_check(ord("S"))) {
    if (!place_meeting(x, y + spd, oCollision)) {
        y += spd;
    }
}

// Esquerda
if (keyboard_check(vk_left) or keyboard_check(ord("A"))) {
    if (!place_meeting(x - spd, y, oCollision)) {
        x -= spd;
    }
    image_xscale = -1;
}

// Direita
if (keyboard_check(vk_right) or keyboard_check(ord("D"))) {
    if (!place_meeting(x + spd, y, oCollision)) {
        x += spd;
    }
    image_xscale = 1;
}

var _movendo = keyboard_check(vk_up) or keyboard_check(vk_down) or 
               keyboard_check(vk_left) or keyboard_check(vk_right) or
               keyboard_check(ord("W")) or keyboard_check(ord("A")) or 
               keyboard_check(ord("S")) or keyboard_check(ord("D"));

if (_movendo) {
    sprite_index = sPlayerWalk;
} else {
    sprite_index = sPlayer;
}
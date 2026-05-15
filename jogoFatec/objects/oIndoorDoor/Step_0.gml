var perto = place_meeting(x, y, oPlayer);

// Interação "E"
if (perto && keyboard_check_pressed(ord("E")))
{
	dialogo("porta_trancada");
    /*
	global.lastRoom = "ADS";
    room_goto(RoomADS);
	*/
}

// Botão "E"
if (perto)
{
    // Destroi qualquer prompt antigo antes de criar um novo - Evitar ficar piscando
    if (instance_exists(oPressE_Door))
        instance_destroy(oPressE_Door);
    
    // Cria um novo
    var prompt = instance_create_depth(x, y, -200, oPressE_Door);
    prompt.dono = id;
}
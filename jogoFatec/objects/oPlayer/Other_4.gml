// Posicionar o player ao entrar nas salas

if room == Room1{ // Início
	if global.lastRoom == "ADS"{
		x = oPredio1.x;
		y = oPredio1.y + 55;
	} else if global.lastRoom == "SistemasEmb"{
		x = oPredio2.x;
		y = oPredio2.y + 55;
	}
} else if room == RoomADS { // Sala ADS
	x = oDoorADS.x;
	y = oDoorADS.y + 55;
	
} else if room == RoomSistemasEmb { // Sala Sistemas Embarcados
	x = oDoorSistemasEmb.x;
	y = oDoorSistemasEmb.y + 55;
	
}
// Posicionar o player ao entrar nas salas

if room == Room1{ // Início
	if global.lastRoom == "Predio1"{
		x = oPredio1.x;
		y = oPredio1.y + 50;
	} else if global.lastRoom == "Predio2"{
		x = oPredio2.x  + 50;
		y = oPredio2.y;
		
		
	} else if global.lastRoom == "Room1"{
		y = oChangeRoom.y - 20
	}  else if global.lastRoom == "Room2"{
		y = oChangeRoom.y + 20
	}
	

} else if room = Room2{
	if global.lastRoom == "Room1"{
			y = oChangeRoom.y - 20
		}  else if global.lastRoom == "Room2"{
			y = oChangeRoom.y + 20
		}
		
}else if room == RoomADS { // Predio1
	x = oDoorPredio1.x;
	y = oDoorPredio1.y + 50;
	
} else if room == RoomSistemasEmb { // Predio2
	x = oDoorPredio2.x;
	y = oDoorPredio2.y + 50;
}
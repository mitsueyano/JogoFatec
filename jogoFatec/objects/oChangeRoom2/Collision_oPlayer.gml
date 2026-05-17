if room == Room2{
	global.lastRoom = "Room2";
	room_goto(Room3);
	
} else if room == Room3{
	global.lastRoom = "Room3"
	room_goto(Room2)
}

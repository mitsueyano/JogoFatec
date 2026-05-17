if room == Room1{
	global.lastRoom = "Room1";
	room_goto(Room2);
	
} else if room == Room2{
	global.lastRoom = "Room2"
	room_goto(Room1)
}

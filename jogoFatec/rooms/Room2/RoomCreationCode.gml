switch global.lastRoom{
	case "Room1":
		oPlayer.y = oChangeRoom.y - 20
		break;
	case "Room3":
		oPlayer.y = oChangeRoom2.y + 20
		break;
	default: break;
}
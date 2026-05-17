switch global.lastRoom{
	case "Room2":
		oPlayer.y = oChangeRoom.y + 20
		break;
	case "Predio1":
		oPlayer.x = oPredio1.x + 17;
		oPlayer.y = oPredio1.y + 50;
		break;
	case "Predio2":
		oPlayer.x = oPredio2.x + 50;
		oPlayer.y = oPredio2.y + 17;
		break;
	default: break;
}



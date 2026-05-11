switch global.lastRoom{
	case "Room2":
		oPlayer.y = oChangeRoom.y + 20
		break;
	case "Predio1":
		oPlayer.x = oPredio1.x;
		oPlayer.y = oPredio1.y + 50;
		break;
	case "Predio2":
		oPlayer.x = oPredio2.x + 50;
		oPlayer.y = oPredio2.y;
		break;
	default: break;
}
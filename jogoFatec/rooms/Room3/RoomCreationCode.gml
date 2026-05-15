switch global.lastRoom{
	case "Room2":
		oPlayer.y = oChangeRoom2.y - 20;
		break;
	case "Predio3":
		oPlayer.x = oPredio3.x + 50;
		oPlayer.y = oPredio3.y;
		break;
	default: break;
}
function scr_cutscenes(cutscene_fase) {
    switch (cutscene_fase) {

        case "Secretaria":
			cutscene_secretaria();     
        break;
		
		case "Celular":
			cutscene_celular();     
        break;
		
		default: break;
    }
}
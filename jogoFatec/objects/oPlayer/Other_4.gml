if (room == Predio1) {

    if (global.teleporte_cutscene == true) {
        x = global.teleporte_x;
        y = global.teleporte_y;
        global.lastRoom = "Predio1";
        global.teleporte_cutscene = false; 
    } else {
        x = oDoorPredio1.x;
        y = oDoorPredio1.y - 50;
    }
}

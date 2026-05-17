surface_resize(application_surface, 1280, 720);
window_set_size(1280, 720);
window_center();
persistent = true;
depth = -5;

// Variáveis do player
spd = 2;
col = spd + 2;

// Globais
global.lastRoom = "";
global.dialogo = false;

// Cutscenes
global.InteracaoSecretaria = false;
global.cutscene = false;
global.cutscene_fase = "";
global.cutscene_subfase = "";
global.cutscene_rodou = false;
global.cutscene_dialogo_visto = false;
global.msg = 1;

// Teleporte
global.teleporte_cutscene = false;
global.teleporte_x = 0;
global.teleporte_y = 0;
global.escuro = false;
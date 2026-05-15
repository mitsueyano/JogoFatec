surface_resize(application_surface, 1280, 720);
window_set_size(1280,720);
window_center();

persistent = true;
depth = -100

//------------------------------- variáveis


// velocidade do personagem
spd = 2 

// Configuração da colisão com objetos
col = spd + 2

global.lastRoom = "";
global.dialogo = false
global.InteracaoSecretaria = false


global.cutscene = false;
global.cutscene_fase = "";
global.cutscene_subfase = "";
global.cutscene_rodou = false;

global.msg = 1
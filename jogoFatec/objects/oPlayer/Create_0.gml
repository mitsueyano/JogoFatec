surface_resize(application_surface, 1280, 720);
window_set_size(1280,720);
window_center();

persistent = true;
depth = -100

//------------------------------- variáveis

// Configuração cutscene
cutscene_fase = 0;
cutscene_dialogo_iniciado = false;

// velocidade do personagem
spd = 2 

// Configuração da colisão com objetos
col = spd + 2

global.lastRoom = "";
global.dialogo = false
global.InteracaoSecretaria = false
global.cutscene = false;
function scr_textos(){
	switch npc_nome{
		case "FirstNPC":
			ds_grid_add_text(textos_grid, "Oiê, você é um dos novos calouros aqui da integração né? Seja bem vindo!", "FirstNPC");
			ds_grid_add_text(textos_grid, "Sinta-se à vontade para entrar na secretaria kk", "FirstNPC");
			ds_grid_add_text(textos_grid, "Não sei mais oq dizer", "FirstNPC");
			ds_grid_add_text(textos_grid, "Pibbles são legais", "Player");
		break;
		
		// ---------- Cutscenes
		//Secretária
		case "Secretaria":
			ds_grid_add_text(textos_grid, "Olá, eu precisava de um Gmail", "Player");
			ds_grid_add_text(textos_grid, "Tabom vou lá buscar", "Secretária");
			global.InteracaoSecretaria = true
		break;
		case "pensamento_pos_secretaria":
		    ds_grid_add_text(textos_grid, "...", "Player");
		break;
		case "connWifi":
		    ds_grid_add_text(textos_grid, "Olha, a senha do wifi", "Player");
			ds_grid_add_text(textos_grid, "Conectando...", "Player");
		break;
		
		//Notificação no celular
		case "notificacao1":
		    ds_grid_add_text(textos_grid, "Nossa, quantas notificações.", "Player");
			ds_grid_add_text(textos_grid, "Instagram... Mãe... Linkedin...", "Player");
			ds_grid_add_text(textos_grid, "Perai, O que é isso?", "Player");
		break;
		
		case "notificacao2":
		    ds_grid_add_text(textos_grid, "Que estranho, acho melhor falar com algúem.", "Player");
		break;
		
		// ---------- Falas solo 
        case "porta_trancada":
            ds_grid_add_text(textos_grid, "A porta está trancada...", "Player");
        break;
	}
}


function ds_grid_add_row(_grid){
    ds_grid_resize(_grid, ds_grid_width(_grid), ds_grid_height(_grid) + 1);
    return (ds_grid_height(_grid) - 1);
}

function ds_grid_add_text(_grid, _texto, _nome){
    var _y = ds_grid_add_row(_grid);    

    _grid[# Infos.Quem, _y] = _nome; 
    _grid[# Infos.Texto, _y] = _texto;
}

// Falas solo
function dialogo(_identificador){
    var _inst = instance_create_layer(0, 0, "Dialogo", oDialogo);
    _inst.npc_nome = _identificador;
    global.dialogo = true;
    return _inst;
}
function scr_textos(){
	switch npc_nome{
		case "FirstNPC":
			ds_grid_add_text(textos_grid, "Oiê, você é um dos novos calouros aqui da integração né? Seja bem vindo!", "FirstNPC");
			ds_grid_add_text(textos_grid, "Sinta-se à vontade para entrar na secretaria kk", "FirstNPC");
			ds_grid_add_text(textos_grid, "Não sei mais oq dizer", "FirstNPC");
			ds_grid_add_text(textos_grid, "Pibble", "Player");
		break;
		case "Secretaria":
			ds_grid_add_text(textos_grid, "Olá, eu precisava de um Gmail", "Player");
			ds_grid_add_text(textos_grid, "Tabom vou lá buscar", "Secretária");
			global.InteracaoSecretaria = true
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
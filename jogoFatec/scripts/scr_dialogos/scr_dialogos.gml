function scr_dialogo_inicializar() {
    global.banco_de_dados = {};
    
    if (!file_exists("dialogos.json")) {
        show_debug_message("ERRO: dialogos.json não encontrado!");
        return false;
    }
    
    var _file = file_text_open_read("dialogos.json");
    var _json_string = "";
    while (!file_text_eof(_file)) { 
        _json_string += file_text_readln(_file); 
    }
    file_text_close(_file);
    
    global.banco_de_dados = json_parse(_json_string);
    show_debug_message("Banco de dados carregado!");
    return true;
}

function grid_add_row(_grid){
    ds_grid_resize(_grid, ds_grid_width(_grid), ds_grid_height(_grid) + 1);
    return (ds_grid_height(_grid) - 1);
}

function grid_add_texto(_grid, _texto, _nome){
    var _y = grid_add_row(_grid);    
    _grid[# Infos.Quem, _y] = _nome; 
    _grid[# Infos.Texto, _y] = _texto;
}

function dialogo(_id_da_fala) {
    var _inst = instance_create_layer(0, 0, "Dialogo", oDialogo);
    _inst.npc_nome = _id_da_fala;
    global.dialogo = true;
    return _inst;
}

function carregar_dialogo_json(_id_da_fala, _grid) {
    if (!variable_global_exists("banco_de_dados") || global.banco_de_dados == undefined) {
        var _sucesso = scr_dialogo_inicializar();
        if (!_sucesso) return;
    }
    if (variable_struct_exists(global.banco_de_dados, _id_da_fala)) {
        var _lista_falas = variable_struct_get(global.banco_de_dados, _id_da_fala);
        var _total_linhas = array_length(_lista_falas);
        for (var _i = 0; _i < _total_linhas; _i++) {
            var _fala_atual = _lista_falas[_i];
            grid_add_texto(_grid, _fala_atual.texto, _fala_atual.emissor);
        }
    } else {
        show_debug_message("ERRO: ID '" + _id_da_fala + "' não existe no JSON.");
    }
}

function scr_dialogos_trigger(){
    carregar_dialogo_json(npc_nome, textos_grid);
    
    switch (npc_nome) {
        case "Secretaria":
            global.InteracaoSecretaria = true;
        break;
        case "cesar":
            global.interacaoCesar = true;
        break;
    }
}
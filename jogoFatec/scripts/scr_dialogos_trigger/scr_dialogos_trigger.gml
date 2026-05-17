function scr_textos(){
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
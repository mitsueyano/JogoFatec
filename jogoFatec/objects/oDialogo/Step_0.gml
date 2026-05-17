   if (inicializar == false){
       scr_dialogos_trigger();
       inicializar = true;
       alarm[0] = 1;
   }
   
   if (mouse_check_button_pressed(mb_left)){
   var _texto_completo = textos_grid[# Infos.Texto, pagina];
       if (caractere < string_length(_texto_completo)){ // Se ainda está "digitando", mostra o texto todo de uma vez
           caractere = string_length(_texto_completo);
           audio_stop_sound(dialog); // Para o som imediatamente ao pular
       } else {
           if (pagina < ds_grid_height(textos_grid) - 1 ){// Se já terminou de digitar, vai para a próxima página
               pagina++;
               caractere = 0;
               alarm[0] = 1; // Reinicia o alarme para a nova frase
           } else {
               global.dialogo = false;
               instance_destroy();
           }
       }
   }
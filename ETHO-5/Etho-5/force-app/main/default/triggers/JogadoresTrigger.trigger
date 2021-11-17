trigger JogadoresTrigger on Jogador__c(before update) {

   if (Trigger.isBefore){//verifica contexto
       if (Trigger.isUpdate) {//verifica contexto
             JogadoresTriggerHandler.beforeUpdate(Trigger.new, Trigger.oldMap);
         /* for (Jogador__c jogador :Trigger.new){//realiza uma iteração
               Jogador__c jogadorOld = Trigger.oldMap.get(jogador.Id);

              if (!jogadorOld.Eliminado__c && jogador.Eliminado__c){//verfica 2 condições
                  jogador.Data_da_Morte__c = System.now();//atribuição
              }
          }*/
       }
   }    
}
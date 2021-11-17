trigger JogadoresTrigger on Jogador__c(before update) {

   if (Trigger.isBefore){
       if (Trigger.isUpdate) {
          for (Jogador__c jogador :Trigger.new){
               Jogador__c jogadorOld = Trigger.oldMap.get(jogador.Id);

              if (!jogadorOld.Eliminado__c && jogador.Eliminado__c){
                  jogador.Data_da_Morte__c = System.now();
              }
          }
       }
   }    
}
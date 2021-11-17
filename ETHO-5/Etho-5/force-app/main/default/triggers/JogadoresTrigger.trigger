trigger JogadoresTrigger on Jogador__c(before update) {

   if (Trigger.isBefore){//verifica contexto
       if (Trigger.isUpdate) {//verifica contexto
             JogadoresTriggerHandler.beforeUpdate(Trigger.new, Trigger.oldMap);        
       }
   }    
}
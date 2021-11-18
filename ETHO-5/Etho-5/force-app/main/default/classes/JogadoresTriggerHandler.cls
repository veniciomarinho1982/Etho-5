public without sharing class JogadoresTriggerHandler {
    public static void beforeUpdate(List<jogador__c>  records, Map<id, jogador__c> oldMap){
          for (Jogador__c jogador :records){//realiza uma iteração
                beforeUpdate(jogador,oldMap.get(jogador.id));         
          }
    }

    private static void beforeUpdate(Jogador__c record,Jogador__c recordOld){
        if(isChanged(recordOld.Eliminado__c,record.Eliminado__c)){
            record.Data_da_Morte__c = System.now();//atribuição
        }        
    }

    private static Boolean isChanged(Boolean value, Boolean valueToCompare){
        return value != valueToCompare;
    }
}
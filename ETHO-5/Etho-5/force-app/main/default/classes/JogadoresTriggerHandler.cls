public without sharing class JogadoresTriggerHandler {
    public static void beforeUpdate(List<jogador__c>  records, Map<id, jogador__c> oldMap){
          for (Jogador__c jogador :Trigger.new){//realiza uma iteração
               Jogador__c jogadorOld = Trigger.oldMap.get(jogador.Id);

              if (!jogadorOld.Eliminado__c && jogador.Eliminado__c){//verfica 2 condições
                  jogador.Data_da_Morte__c = System.now();//atribuição
              }
          }
    }
}

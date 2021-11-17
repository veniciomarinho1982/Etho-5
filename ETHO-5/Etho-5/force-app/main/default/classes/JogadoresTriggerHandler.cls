public without sharing class JogadoresTriggerHandler {
    public static void beforeUpdate(List<jogador__c>  records, Map<id, jogador__c> oldMap){
          for (Jogador__c jogador :records){//realiza uma iteração
               Jogador__c jogadorOld = oldMap.get(jogador.Id);

              if (!jogadorOld.Eliminado__c && jogador.Eliminado__c){//verfica 2 condições
                  jogador.Data_da_Morte__c = System.now();//atribuição
              }
          }
    }
}

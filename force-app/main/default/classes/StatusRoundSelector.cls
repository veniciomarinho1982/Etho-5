public with sharing class StatusRoundSelector {
    public static List<Round__c> selectByRoundsIdsWithJogadores(Set<Id> ids) {
        return [
              SELECT (SELECT Id,Velocidade__c , Forca__c, Inteligencia__c  
                        FROM Jogadores__r 
                       WHERE Eliminado__c = false)
                FROM Round__c 
               WHERE Status__c IN :ids
        ];
    }
}
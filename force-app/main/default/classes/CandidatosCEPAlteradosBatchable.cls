public with sharing class CandidatosCEPAlteradosBatchable implements Database.Batchable<SObject>, Database.Stateful {
    
    String error;

    public Database.QueryLocator start(Database.BatchableContext BC){
        //return Database.getQueryLocator(CandidatoSelector.getQueryLocatorCEPBatchable());
        System.debug('Entrou no start');
        return Database.getQueryLocator(CandidatoSelector.getQueryLocatorCEPBatchable());
    }

    public void execute(Database.BatchableContext BC, List<Candidato__c> scope){
        System.debug('Vai executar');
        for (Candidato__c record : scope){
          record.CEPAlterado__c = false;
          error += record.Id + ' - ';
          // System.debug('Record: '+record.Name);
          //CustomNotification.notifyUsers(record.Id);
       }     
    } 

    public void finish(Database.BatchableContext BC){
         System.debug('error: '+ error);
    }
}

public with sharing class SobjetcFiels {
    public SobjetcFiels() {
       
        Map<Schema.SObjectField, Object> fieldsValueMap = new Map<Schema.SObjectField, Object> {
            Candidato__c.CEPAlterado__c     => false,
            Candidato__c.DataUltimaBatch__c => System.today()
        };
    }
}

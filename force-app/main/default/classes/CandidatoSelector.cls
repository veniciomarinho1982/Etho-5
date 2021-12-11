public without sharing class CandidatoSelector {
    public static String getQueryLocatorCEPBatchable() {
      return 'SELECT Id,Name FROM Candidato__c WHERE CEPAlterado__c = TRUE';
    }
}

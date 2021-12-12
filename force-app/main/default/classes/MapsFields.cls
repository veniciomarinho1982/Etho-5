public with sharing class MapsFields {
        private String query;

        Map<Schema.SObjectField, Object> fieldsValuesMap = new Map<Schema.SObjectField, Object> ();
               
        String e = 'Lead'; // Object to be updated
	    String f = 'LeadSource'; // field to be updated.
	    String v = 'DarkWeb'; // value with which field will be populated.
	    String q = 'SELECT ' + f + ' FROM ' + e; // Query to which more filters can be added like: + 'AND IsConverted = false';
	    


    //    Database.executeBatch(new UpdateFieldsBatchable(query,null));
            


       // Map<Schema.SObjectField, Object> fieldsValuesMap = new Map<Schema.SObjectField, Object> {
       //     Candidato__c.CEPAlterado__c => false,
       //     Candidato__c.DataUltimaBatch__c => System.today()
      //  };

       // Map<Schema.SObjectField, Object> fieldsValuesMap = new Map<Schema.SObjectField, Object> {
       //     Round__c.Status__c => 'Finalizado',
       //     Candidato__c.Name => 'soifjf'
       // };

      // Database.executeBatch(new UpdateFieldsBatchable(null,null));
}
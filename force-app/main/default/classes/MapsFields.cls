public with sharing class MapsFields {
        private String query;
             
          String e = 'Account'; // Object to be updated
	    String f = 'BillingState'; // field to be updated.
	    String v = 'RJ'; // value with which field will be populated.
        //  String condicao = 'Name = keu confeitaria'; // value with which field will be populated.
	    String q = 'SELECT BillingState FROM ' + e + ' WHERE ' + f + '';
          //querySelector.getQueryWhereSelector(e, f, condicao) ; // Query to which more filters can be added like: + 'AND IsConverted = false';
	    
        Map<Schema.SObjectField, Object> fieldsValuesMap = new Map<Schema.SObjectField, Object> ();
          //  Account.Name         => BillingState,
           // Account.BillingState => 'RJ'
            Integer count = 200;
            List<Account> changedAccount = [Select ID, Name from Account where Name = 'keu confeitaria'];
           // for(Account ld : changedAccount){
           // }
        

        Id batchInstanceId0 = Database.executeBatch(new UpdateFieldsBatchable(q,e,f,v));
        
}
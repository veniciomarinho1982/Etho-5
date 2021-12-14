@isTest
public without sharing class UpdateFieldsBatchableTest {
    public static testMethod void testLead(){
       
        Test.StartTest();
        
        String e = 'Account';
        String f = 'BillingState';
        String v = 'RJ';
        String q = 'SELECT BillingState FROM ' + e + ' WHERE ' + f + ' != \'RJ\'';
        Id batchInstanceId0 = Database.executeBatch(new UpdateFieldsBatchable(q,e,f,v));
        
        Test.stopTest();
               
               
    }
}
@isTest
public without sharing class UpdateFieldsBatchableTest {
    public static testMethod void testLead(){
        Integer count = 200;

        List<Lead> newLeads = new List<Lead>();
        for(integer i = 0 ; i < count ; i++){
            Lead l = new Lead(LastName = 'ln' + i, Company = 'Company' + i);
            newLeads.add(l);
        }
        
        //Make a Lead record that will not get changed
        newLeads.add(new Lead(LastName = 'LastName', LeadSource = 'Web', Company = 'Some Company'));
        
        insert newLeads;
        
        Test.StartTest();
        
        String e = 'Lead';
        String f = 'LeadSource';
        String v = 'Phone';
        String q = 'SELECT LeadSource FROM ' + e + ' WHERE ' + f + ' != \'Web\'';
        Id batchInstanceId0 = Database.executeBatch(new UpdateFieldsBatchable(q,e,f,v));
        
        Test.stopTest();
        
        System.assertEquals(1, [Select count() from Lead where LeadSource = 'Web']);
        List<Lead> changedLeads = [Select ID, LeadSource from Lead where LeadSource != 'Web'];
        System.assertEquals(count, changedLeads.size());
        for(Lead ld : changedLeads){
            System.assertEquals('Phone', ld.LeadSource);
        }
               
    }
}

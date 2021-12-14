trigger VendaOrgaoTrigger on VendaOrgao__c (before insert) {
    if (Trigger.isbefore) {
        VendaOrgaoTriggerHandler.beforeInsert(Trigger.new);
    }
    
}

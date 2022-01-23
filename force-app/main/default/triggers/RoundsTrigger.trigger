trigger VendasOrgaosTrigger on VendasOrgaos__c (before update) {

    if (Trigger.isAfter && Trigger.isUpdate) {
        VendasOrgaosTriggerHandler.afterUpdate(Trigger.new, Trigger.oldMap);
    }    

}
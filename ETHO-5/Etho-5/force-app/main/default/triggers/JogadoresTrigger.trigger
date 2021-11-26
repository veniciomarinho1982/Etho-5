trigger JogadoresTrigger on Jogador__c  (before insert, before update, after Update) {

    if (Trigger.isBefore) {
        if (Trigger.isUpdate) {
            JogadoresTriggerHandler.beforeUpdate(Trigger.new, Trigger.oldMap);
        } else if (Trigger.isAfter) {
            JogadoresTriggerHandler.afterUpdate(Trigger.new, Trigger.oldMap);
        }
    }

}
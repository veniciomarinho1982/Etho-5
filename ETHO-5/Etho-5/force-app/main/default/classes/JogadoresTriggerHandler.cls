public without sharing class JogadoresTriggerHandler {
    public static void beforeUpdate(List<Jogador__c> records, Map<Id, Jogador__c> oldMap) {
        for (Jogador__c jogador : records) { //realiza uma iteração
            beforeUpdate(jogador, oldMap.get(jogador.Id));
        }
    }

    private static void beforeUpdate(Jogador__c record, Jogador__c recordOld) {
        handleEliminacaoMorte(record, recordOld);
    }

    private static Boolean isChanged(Jogador__c record, Jogador__c recordToCompare, Schema.SObjectField fieldToEvaluate) {
        return isChanged(record.get(fieldToEvaluate), recordToCompare.get(fieldToEvaluate));
    }

    private static Boolean isChanged(Object value, Object valueToCompare) {
        return value != valueToCompare;
    }

    private static void setValue(Jogador__c record, Schema.SObjectField field, Object value) {
        record.put(field, value);
    }  

    private static void handleEliminacaoMorte(Jogador__c record, Jogador__c recordOld) {

        if (foiEliminado(record, recordOld) || morreu(record, recordOld)) {           

            if (ehJogadorPadrao(record) && foiEliminado(record, recordOld)) {
                setValue(record, Jogador__c.Morreu__c, true);
            }

            if (morreu(record, recordOld)) {
                setValue(record, Jogador__c.Eliminado__c, true);
                setValue(record, Jogador__c.DataMorte__c, System.now());
            }
        }        
    }

    private static Boolean ehJogadorPadrao(Jogador__c record) {            
        return record.RecordTypeId.equals(Schema.getRecordTypeInfosByDeveloperNAme().get(RECORD_TYOE_DEVELOPER_NAME_JOGADOR_PADRAO));            
    }

    private static Boolean foiEliminado(Jogador__c record,Jogador__c recordOld) {
        return isChanged(record, recordOld, Jogador__c.Eliminado__c);
    }

    private static Boolean morreu(Jogador__c record,Jogador__c recordOld) {
        return isChanged(record, recordOld, Jogador__c.Morreu__c);
    }
   
}
public with sharing class VendaOrgaoTriggerHandler {
    public static void beforeInsert(List<Jogador__c> records) {
        List<VendaOrgao__c> jogadoresMortos = new List<VendaOrgao__c>();
        for (Jogador__c record : records) {
            setVendaOrgao(record, jogadoresMortos);
        }
        insert jogadoresMortos;
    }

    static void setVendaOrgao(Jogador__c record, List<VendaOrgao__c> setVendaOrgao) {
        setVendaOrgao.add(          
            new VendaOrgao__c(
                Morto__c = record.Id  ,
                DataVencimentoOrgao__c =  TODAY() + 7
            )
        );
    }
}

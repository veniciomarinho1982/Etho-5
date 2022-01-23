@isTest
public without sharing class UpdateFieldsBatchableTest {
@TestSetup
    static void setup() {
        Jogador__c jog1 = new Jogador__c();
        Jogador__c jog2 = new Jogador__c();  
        List<Jogador__c> jogadores = new List<Jogador__c>();
        jogadores.add(jog1);
        jogadores.add(jog2);      
        insert jogadores;
    }

    @isTest
    static void test1() {
        Map<Id, Jogador__c> jogadoresMap = new Map<Id, Jogador__c>([SELECT Id FROM Jogador__c]);

        Test.startTest();
        List<Jogador__c> jogadoresAux = RoundsSelector.selectByJogadoresIds(jogadoresMap.keySet());
        Test.stopTest();

        System.assertEquals(2, jogadoresAux.size());
    }

}
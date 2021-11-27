public with sharing class AssassinatosHandler {
      List<Jogadores_c> jogadoresVivos = StatusSelector.selectByRoundsIdsWithJogadores('Andamento');
      Integer qtdjogadoresVivos = jogadoresVivos.size();

      Integer randomAssassino = Utils.generateRandomIntegerBetween(qtdjogadoresVivos-1);
      Integer randomAssassinado = Utils.generateRandomIntegerBetween(qtdjogadoresVivos-1);
 
      Jogador__c atacante = jogadoresVivos.get(randomAssassino);
      Jogador__c atacante = jogadoresVivos.get(randomAssassinado);
 
    }    

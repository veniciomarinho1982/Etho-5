public with sharing class AssassinatosHandler {
      
    public static void execute(){  
      List<Round__c> records = StatusRoundSelector.selectByRoundsIdsWithJogadores('Andamento');
  
      for (Round__c record : records) {
            handleAssassinato(record);
      } 
    }
   
    private static void randomAssassinato(Round__c record) {
      Lit<Jogador__c> jogadores = round.Jogadores__r;
      Integer qtdJogadoresVivos = jogadores.size();

      if (qtdJogadoresVivos >1)
      {
         jogador__c atacante = Utils.generateRandomIntegerBetween(qtdJogadoresVivos,qtdJogadoresVivos-1);
         jogador__c defensor = Utils.generateRandomIntegerBetween(qtdJogadoresVivos,qtdJogadoresVivos-1);
         
         handleAtributo(atacante,defensor,qtdJogadoresVivos) ;
         handleAssassinato(atacante,defesa,qtdJogadoresVivos); 
      }
    }
    
    private static void handleAssassinato(Jogador__c atacante, Jogador__c defensor, Lit<Jogador__c> qtdJogadoresVivos) {
              
        if (ataque > defesa) {
            setValue(defesa, Jogador__c.Morreu__c, true);
        } else{
                if (ataque < defesa) && (dadoAtacante = 1){
                     handleAtributo(defensor,atacante,qtdJogadoresVivos) ;
                }
        } 
        setValue(atacante, Jogador__c.Morreu__c, true);
        }       
    }

    private static void handleAtributo(Integer ataque, Integer defesa, Integer qtdJogadoresVivos) {
        Integer dadoAtacante = Utils.generateRandomIntegerBetween(qtdJogadoresVivos,-1);
        Integer ataque = dadoAtacante + atacante.Forca__c;
        Integer defesa = Utils.generateRandomIntegerBetween(qtdJogadoresVivos,-1)+
                         Utils.generateRandomIntegerBetween(qtdJogadoresVivos,+1)+
                         defensor.Inteligencia__c+defensor.Velocidade__c;          
        handleAssassinato(atacante,  defensor);                  
    } 
}    

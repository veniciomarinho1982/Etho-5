public class BatatinhaFrita {
           public void execute (Id idPartida)
           {
               ParticipantesPartida__c[] participantes = [SELECT Id, Jogador__c FROM ParticipantesPartida__c WHERE Partida__c = :idPartida];
               System.debug(participantes);
               Jogador__c[] jogadores = new List<Jogador__c>();
               Integer mortes = (Integer) participantes.size() / 2;
               
               for(Integer i = 0; i < mortes; i++)
               {
                   Jogador__c jogador = new Jogador__c();
                   jogador.Id = participantes[i].Jogador__c;
                   jogador.Eliminado__c = true;
                   jogadores.add(jogador);
               }
               
               /*update jogadores;
               
               update new Partida__c(Id = idPartida, TerminoPartida__c = System.now());*/
           
           }
}
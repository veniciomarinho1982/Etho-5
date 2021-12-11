trigger CandidatoTrigger on Candidato__c (after update) {
    List<Candidato__c> candidatosCEP = new List<Candidato__c>();

    for (Candidato__c candidato: (candidatosCEP) trigger.new()){
       if (Candidato.CEPAlterado__c){
           idsCandiatos.add(candidato.Id);
       }
    }
    System.enqueueJob(new CandidatosCEPQueuable(candidatosCEP));
}
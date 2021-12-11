public without sharing class CandidatosCEPAlteradosSchedulable implements Schedulable {
    public void execute(SchedulableContext sc) {
        Database.executeBatch(new CandidatosCEPAlteradosBatchable(),200);
    }
}

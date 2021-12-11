global with sharing class UpdateCandidatosBatchable implements Database.Batchable<SObject>, Database.Stateful 
{
    private String query;
    global String errorMessageHtml;

    global UpdateCandidatosBatchable()
    {
        errorMessageHtml = '';
        query = CandidatoSelector.getQueryLocatorCEPBatchable();
    }

    global Database.QueryLocator start(Database.BatchableContext BC)
    {
        return Database.getQueryLocator(query);
    }

    global void execute(Database.BatchableContext BC, List<SObject> scope)
    {
        for (Candidato__c acc : scope)
        {
            acc.CEPAlterado__c = False;
        }

        List<Database.SaveResult> srList = Database.update(scope, false);
        
        handleLog(srList, scope);
    }

    global void finish(Database.BatchableContext BC)
    {
        sendLog();
    }

    private void handleLog(List<Database.SaveResult> srList, List<Candidato__c> scope)
    {
        for (Integer i = 0; i < scope.size(); i++)
        {
            if (!srList.get(i).isSuccess())
            {
                errorMessageHtml += '====== [' + 'Erro ao atualizar o registro: ' + scope.get(i).Id + '] ====<br/>' ;
                for (Database.Error err: srList.get(i).getErrors())
                {
                    errorMessageHtml += 'Mensagem: ' + err.getMessage() + '<br/>';
                }
            }
        }
    }

    private void sendLog()
    {
        Messaging.SingleEmailMessage message = new Messaging.SingleEmailMessage();
        message.setToAddresses(new List<String>{'veniciomarinho@hotmail.com'});
        message.setSubject('Log de erros');
        message.setHtmlBody(errorMessageHtml);
        List<Messaging.SingleEmailMessage> messages = new List<Messaging.SingleEmailMessage>{message};
        
        Messaging.sendEmail(messages);
    }

}
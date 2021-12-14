global with sharing class UpdateFieldsBatchable implements Database.Batchable<SObject>, Database.Stateful 
{
    global final String Query;
    global final String Entity;
    global final String Field;
    global final String Value;
    global String errorMessageHtml;

    global UpdateFieldsBatchable(String q, String e, String f, String v){
            Query=q; Entity=e; Field=f;Value=v;  
            errorMessageHtml   = '';        
    }

    global Database.QueryLocator start(Database.BatchableContext BC)
    {  
        return Database.getQueryLocator(query);
    }

    global void execute(Database.BatchableContext BC, List<sObject> scope){
      for(Sobject s : scope){s.put(Field,Value); 
      }      
        update scope;            
       
        List<Database.SaveResult> srList = Database.update(scope, false);
        
        handleLog(srList, scope);
    }

    global void finish(Database.BatchableContext BC)
    {
        sendLog();
    }
        
   
    private void handleLog(List<Database.SaveResult> srList, List<SObject>  scope)
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
public with sharing class UpdateFieldsBatchable implements Database.Batchable<SObject>, Database.Stateful{
    
    String query;
    Map<SObjectField, Object> mapa;
    String errorMessageHtml;

    public UpdateFieldsBatchable(String query, Map<SObjectField, Object> mapa){
            this.query = query;
            this.mapa = mapa;
            this.errorMessageHtml   = '';        
    }
    
    public Database.QueryLocator start(Database.BatchableContext BC){  
        return Database.getQueryLocator(query);
    }
    
    public void execute(Database.BatchableContext BC, List<sObject> scope){
      
      for(Sobject record : scope){      
         for (Schema.SObjectField key : mapa.keySet()){
             record.put(key, mapa.get(key));
         }    
      }
      
      List<Database.SaveResult> srList = Database.update(scope, false);
      handleLog(srList, scope);
    }

    public void finish(Database.BatchableContext BC){
        sendLog();
    }
        
   
    private void handleLog(List<Database.SaveResult> srList, List<SObject>  scope){
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
    
    private void sendLog(){
        Messaging.SingleEmailMessage message = new Messaging.SingleEmailMessage();
        message.setToAddresses(new List<String>{'veniciomarinho@hotmail.com'});
        message.setSubject('Log de erros');
        message.setHtmlBody(errorMessageHtml);
        List<Messaging.SingleEmailMessage> messages = new List<Messaging.SingleEmailMessage>{message};
        
        Messaging.sendEmail(messages);
    }

}
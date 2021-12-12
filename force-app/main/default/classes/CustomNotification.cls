public with sharing class CustomNotification {
    public static void notifyUsers(String targetId) {
        Set<String> recipientsIds = new Set<String>{'0055f00000429bMAAQ'};
        // Get the Id for our custom notification type
        CustomNotificationType notificationType = 
            [SELECT Id, DeveloperName 
             FROM CustomNotificationType 
             WHERE DeveloperName='DesktopCelular'];
        
        // Create a new custom notification
        Messaging.CustomNotification notification = new Messaging.CustomNotification();

        // Set the contents for the notification
        notification.setTitle(' CEP alterado   ');
        notification.setBody('Alguém alterou o CEP desse registro.\n Favor conferir as informações de endereço.');

        // Set the notification type and target
        notification.setNotificationTypeId(notificationType.Id);
        notification.setTargetId(targetId);
        
        // Actually send the notification
        try {
            notification.send(recipientsIds);
        }
        catch (Exception e) {
            System.debug('Problem sending notification: ' + e.getMessage());
        }
    }
}
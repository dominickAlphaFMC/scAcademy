public with sharing class ClassComponentController {

    @AuraEnabled
    public static void sendEmail(String toAddress, String subject, String body) {
        try {


            System.debug('MY APEX MEHTOD FIRED');

            System.debug('to address');
            System.debug(toAddress);

            System.debug('subject');
            System.debug(subject);

            System.debug('body');
            System.debug(body);

            List<Messaging.SingleEmailMessage> emails = new List<Messaging.SingleEmailMessage>();
            System.debug('ENTERING SEND EMAIL METHOD');
            Messaging.SingleEmailMessage email = new Messaging.SingleEmailMessage();
            email.setToAddresses(new List<String>{toAddress});
            email.setSubject(subject);
            email.setHtmlBody(body);
            emails.add(email);    
            
            Messaging.sendEmail(emails);

        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }


}
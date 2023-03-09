public class ContactTriggerHandler {

    public static String EMAIL_TEMPLATE_ID = '00X3C000000oKafUAE';
    
    
    //AFTER INSERT
    public static void checkIfShouldSendEmail(List<Contact> cons) {
        System.debug('ENTERING SEND checkIfShouldSendEmail METHOD');

        List<Contact> consToSendEmailsTo = new List<Contact>();
        for (Contact con : cons) {
            if (con.Send_Email__c) {
                consToSendEmailsTo.add(con);
            }
        }
		sendEmails(consToSendEmailsTo);     
    }
    
    //AFTER UPDATE
    public static void checkIfShouldSendEmail(List<Contact> newCons, Map<Id, Contact> oldConMap) {
        List<Contact> consToSendEmailsTo = new List<Contact>();
        System.debug('ENTERING SEND checkIfShouldSendEmail METHOD');

        for (Contact newCon : newCons) {
            Contact oldCon = oldConMap.get(newCon.Id);
            if (newCon.Send_Email__c == true && newCon.Send_Email__c != oldCon.Send_Email__c) {
                consToSendEmailsTo.add(newCon);
            }
        }
        sendEmails(consToSendEmailsTo);     
     }
        
    public static void sendEmails(List<Contact> cons) {
        
        List<Messaging.SingleEmailMessage> emails = new List<Messaging.SingleEmailMessage>();
        System.debug('ENTERING SEND EMAIL METHOD');
		Set<Id> conIds = new Set<Id>();
        for (Contact con : cons) {
            Messaging.SingleEmailMessage email = new Messaging.SingleEmailMessage();
            email.setToAddresses(new List<String>{con.Email});
            email.setTemplateId(EMAIL_TEMPLATE_ID);  
            email.setTargetObjectId(con.Id);
            System.debug('email');
            System.debug(email);
            emails.add(email);
            conIds.add(con.Id);

        }
        
        Messaging.sendEmail(emails);

        List<Contact> requeriedCons = [SELECT Id, Send_Email__c FROM Contact WHERE Id IN :conIds];
        for (Contact requeriedCon : requeriedCons) {
            requeriedCon.Send_Email__c = false;
        }
        Database.update(requeriedCons, false);
        
    }
        
    
    
    public static void updateContactBirthday(List<Contact> trigCons) {
        
        for (Contact con : trigCons) {
            con.Birthdate = System.today();
        }
        
    }
    
    
    public static void createTasks(List<Contact> trigCons) {
        
        List<Task> tasksToInsert = new List<Task>();
        for (Contact con : trigCons) {
            for (Integer i = 1; i < 500; i++) {
                Task task = new Task();
                task.Subject = 'Test';
                task.ActivityDate = System.today().addDays(3);
                task.WhoId = con.Id;
                tasksToInsert.add(task);
            }
        }
        
        Database.insert(tasksToInsert, false);
        
        
    }
    
    
}
trigger ContactTrigger on Contact (before insert, before update, after insert, after update) {
    
    if (Trigger.isBefore && Trigger.isInsert) {
        //Do Before Insert code
    } else if (Trigger.isBefore && Trigger.isUpdate) {
        //Do Before Update code
        //ContactTriggerHandler.updateContactBirthday(Trigger.new);
        //Trigger.new == List<Contact>
    } else if (Trigger.isAfter && Trigger.isUpdate) {
        //Do After Update code
        //ContactTriggerHandler.createTasks(Trigger.new);      
        
        ContactTriggerHandler.checkIfShouldSendEmail(Trigger.new, Trigger.oldMap);

     /* Trigger.new - List of records with newly modified state
        Trigger.old - list of record with their old state (in insert this is null)
        Trigger.newMap - Map<Id, SObject> of newly modified state
        Trigger.oldMap - Map<Id, SObject> of old state */
        
    } else if (Trigger.isAfter && Trigger.isInsert) {
        //Do After Insert code
        ContactTriggerHandler.checkIfShouldSendEmail(Trigger.new);
        
    }


}
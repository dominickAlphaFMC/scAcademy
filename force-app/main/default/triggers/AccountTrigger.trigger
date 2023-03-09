trigger AccountTrigger on Account (before insert) {
    
    if (Trigger.isBefore && Trigger.isInsert) {
        AccountTriggerHandler.checkForPotentialDuplicate(Trigger.new);
    } else if (Trigger.isBefore && Trigger.isUpdate) {

    } else if (Trigger.isAfter && Trigger.isUpdate) {

    } else if (Trigger.isAfter && Trigger.isInsert) {
        
    }
}
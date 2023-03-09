trigger OpportuntiyTrigger on Opportunity (before insert) {

    
    //TRIGGER.NEW CONTAINS LIST<>
    
    OpportunityTriggerHandler.oppNameGenerator(Trigger.new);
    
    
    
}
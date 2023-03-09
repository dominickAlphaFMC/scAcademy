public class OpportunityTriggerHandler {
    
    public static void oppNameGenerator(List<Opportunity> opps) {
        
        List<Opportunity> queriedOpps = [SELECT Id, StageName
                                         FROM Opportunity 
                                         WHERE Id = '0063C00000LgHEcQAN'];
        					//Key, Value, Map
        Map<String, String> firstNameLastNameMap = new Map<String, String>();
        firstNameLastNameMap.put('Dominick', 'DeFazio');
        
        
        
        
        
    }
    

}
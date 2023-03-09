public class AccountTriggerHandler {
    public static void checkForPotentialDuplicate(List<Account> accs) {

        Map<String, Account> accNameAccMap = new Map<String, Account>();
        Map<String, Account> accWebsiteAccMap = new Map<String, Account>();
        
        for (Account acc : accs) {
            if (acc.Website != null) {
                accWebsiteAccMap.put(acc.Website, acc);
            }
            accNameAccMap.put(acc.Name, acc);
        }
       
        List<Account> potentialDuplicates = [SELECT Id, Name, Website 
                                             FROM Account 
                                             WHERE (Name IN :accNameAccMap.keySet() 
                                                    OR Website IN :accWebsiteAccMap.keySet())];

        for (Account potentialDuplicate : potentialDuplicates) {
            
            if (accWebsiteAccMap.get(potentialDuplicate.Website) != null) {
                Account trigAccount = accWebsiteAccMap.get(potentialDuplicate.Website);
                trigAccount.Potential_Duplicate__c = true;
            }
            
            if (accNameAccMap.get(potentialDuplicate.Name) != null) {
                Account trigAccount = accNameAccMap.get(potentialDuplicate.Name);
                trigAccount.Potential_Duplicate__c = true;
            }
            
        }
        
        
        
		/*
        for (Account acc : accs) {
            //20000 * 10000
            for (Account duplicate : potentialDuplicates) {
                if (acc.Name == duplicate.Name || acc.Website == duplicate.Website) {
                    acc.Potential_Duplicate__c = true;
                }
            }
        }*/
        
        
		        
        
        
    }
    

}
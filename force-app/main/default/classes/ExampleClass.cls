public class ExampleClass {
    
    public static List<Contact> exampleMethod(String exampleString) {

        return new List<Contact>();
        
    }
    
    
    public static Account findMostRecentlyUpdatedAccount() {
        
        List<Account> accs = [SELECT Id 
                              FROM Account 
                              ORDER BY LastModifiedDate DESC 
                              LIMIT 1];
        return accs[0];
        
    }
    
    
    
    
    
}
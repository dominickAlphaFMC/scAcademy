public class ContactRetriever {
    
    public static Contact findContact(String firstName) {
        
        return [SELECT Id FROM Contact WHERE FirstName = :firstName LIMIT 1];
    }

}
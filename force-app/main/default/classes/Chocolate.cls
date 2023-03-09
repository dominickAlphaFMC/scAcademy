public class Chocolate {
   
    public static Contact chocolateService(String firstName) {
        return [SELECT Id FROM Contact WHERE FirstName = :firstName LIMIT 1];
       
    }

}
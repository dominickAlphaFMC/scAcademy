//Security Declaration     //What it is         //Name of the class
public                     class               AcademyUtility {

    //Security Declaration     //Complicated      //Return Type        //Name of the method
    public                     static              void                myFirstMethod() {
        
        
    }
    
    
    public static Contact contactCreator(String firstName, String lastName) {
              
        Contact con = new Contact();
        con.FirstName = firstName;
        con.LastName = lastName;
        return con;
        
    }
    
    
    public static String returnString() {
        return 'Dom is tired';
    }
    
    
    
    public static void contactInserter() {
        
        
        
        
        /*
//SELECT - fields
List<Account> queriedAccs = [SELECT Id, Name 
//FROM - choose an object
FROM Account
//WHERE = which records based on the criteria
WHERE Id = '0013C00000oSkn0QAC']; */
        
        /*[SELECT Id FROM Contact WHERE FirstName = 'Dom' AND LastName = 'DEF'];

[SELECT Id FROM Contact WHERE (FirstName = 'Dom' OR LastName = 'DEF') AND...];

[SELECT Id FROM Contact WHERE FirstName != 'Dom'];*/
        
        DateTime now = System.now().addDays(-100);
        
        //[SELECT Id FROM Contact WHERE BirthDate > :now];
        
        String domString = 'Dom';
        //[SELECT Id FROM Contact WHERE FirstName = :domString];
        //do%inic% = dominick
        //[SELECT Id FROM Contact WHERE FirstName LIKE 'do%inic%'];
        
        
        List<Contact> cons = new List<Contact>();
        List<Account> accs = [SELECT Id FROM Account LIMIT 500];
        for (Account acc : accs) {
            Contact con = new Contact();
            con.LastName = 'DeFazio';    
            con.AccountId = acc.Id;
            cons.add(con);
            //cons.add(new Contact(FirstName = 'Dom', AccountId = acc.Id));
        }
        
        Database.insert(cons, false);
        //insert cons;
        
        //SOQL Best Practices
        //BE SELECTIVE
        //DONT PUT SOQL IN FOR LOOPS
        
        
        
        
        
        
        
    }
}
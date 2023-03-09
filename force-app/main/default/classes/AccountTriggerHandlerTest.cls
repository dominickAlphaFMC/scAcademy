@IsTest
public class AccountTriggerHandlerTest {
    
	//ADD NECESSARY DATA FOR YOUR TEST
	//Test data only exists in tests
	//Tests cant see live data unless specified otherwise (very unusual)
	//Test can see SETUP data (users, settings, profiles)
    @TestSetup 
    public static void testSetup() {
        List<Account> testAccounts = new List<Account>();
        for (Integer i = 0; i < 100; i++) {
            Account testAccount = new Account();
            testAccount.Name = 'TESTING' + i;
            testAccount.Website = 'TEST' + i + '.com';   
            testAccounts.add(testAccount);
        }
        insert testAccounts;        
    }
    
    
    @IsTest
    public static void testingSingleAccountNameMatch() {
        //SETUP METHOD
        Account acc = new Account();
        acc.Name = 'TESTING1';
        
        //RUN TEST
        Test.startTest();
        insert acc;
        Test.stopTest();
        System.debug(acc);

        //REQUERY METHOD DATA
        Account requeriedAcc = [SELECT Id, Potential_Duplicate__c 
                                FROM Account 
                                WHERE Id = :acc.Id];
               
        //ASSERT TRUTH - this should be the whole of the point of the test
        System.assert(requeriedAcc.Potential_Duplicate__c == true);
    }
    
    
    @IsTest
    public static void testingBulkAccountWebsiteMatch() {
        //SETUP METHOD
        List<Account> testAccounts = new List<Account>();
        for (Integer i = 0; i < 100; i++) {
            Account testAccount = new Account();
            testAccount.Name = 'TESTING TESTING' + i;
            testAccount.Website = 'TEST' + i + '.com';   
            testAccounts.add(testAccount);
        }
        
        //RUN TEST
        Test.startTest();
        insert testAccounts;   
        Test.stopTest();
        
        //REQUERY METHOD DATA
        List<Account> requeriedAccs = [SELECT Id, Potential_Duplicate__c 
                                FROM Account 
                                WHERE Name LIKE 'TESTING TESTING%'];
        
        //ASSERT TRUTH - this should be the whole of the point of the test
        for (Account requeriedAcc : requeriedAccs) {
            System.assert(requeriedAcc.Potential_Duplicate__c == true);            
        }
    }    
    
    
}
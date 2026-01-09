@isTest
public class ContactTriggerHandlerTest {
	@isTest
    public static void accountUpdationPositiveTest(){
        List<contact> contactList = TestObjectFactory.contactCreation(5);
        Account acc = new Account(Name = 'Test Account ');
        insert acc;
        for(contact con : contactList){
            con.accountId = acc.Id;
        }
        insert contactList;
        Account account = [SELECT Id, Rating FROM Account WHERE Id =: acc.Id LIMIT 1];
        System.assertEquals(account.Rating, 'Warm','Rating not updated');
    }
}
@isTest
public class AccountTriggerHandler2Test {

    @isTest
    static void accountUpdationPositiveTest() {
        List<account> accountList = TestObjectFactory.accountCreation(5);
        Account acc = new Account(Name = 'Parent Account');
        insert acc;
        for(Account account : accountList)
        {
            account.ParentId = acc.Id;
        }
        insert accountList;
        
        List<Account> accList = [SELECT Id, ParentId FROM Account WHERE ParentId =: acc.Id];
        System.assertEquals(accList.size(), 5, 'Accounts are inserted Incorrectly');
    }
}
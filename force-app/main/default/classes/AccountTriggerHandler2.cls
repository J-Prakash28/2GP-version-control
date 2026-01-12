public class AccountTriggerHandler2 {
    public static void beforeInsert(List<Account> accList) {
		assignAccountValues(accList);
        createContact(accList);
    }
    
    public static void afterInsert(List<Account> accList){
        
    }
    
    public static void assignAccountValues(List<Account> accList){
        for(Account acc : accList)
        {
            acc.Rating = 'Hot';
        }
    }

    public static void createContact(List<Account> accList){
        List<Contact> contactList = new List<Contact>();
        for(Account acc : accList){
            Contact con = new Contact();
            con.LastName = 'Test Contact';
            con.AccountId = acc.Id;
            contactList.add(con);
        }
        if(!contactList.isEmpty()){
            insert contactList;
        }
    }
}
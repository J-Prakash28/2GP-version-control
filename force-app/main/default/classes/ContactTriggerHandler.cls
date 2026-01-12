public class ContactTriggerHandler {
    public static void beforeInsert(List<contact> contactList){
        //updateAccount(contactList);
        //createAccount(contactList);
    }
    
    public static void afterInsert(List<contact> contactList){
        afterContactInserted(contactList);
    }
    
    public static void updateAccount(List<contact> contactList){
        Set<Id> accountIdSet = new Set<Id>();
        for(Contact con : contactList){
            if(con.accountId != null){
                accountIdSet.add(con.accountId);
            }
        }
        if(!accountIdSet.isEmpty()){
            List<Account> accountList = [SELECT Id, Name FROM Account WHERE Id IN : accountIdSet];
            for(Account acc : accountList){
                acc.Rating = 'warm';
            }
            if(!accountList.isEmpty()){
                update accountList;
            }
        }
    }
    
    public static void createAccount(List<contact> contactList){
        List<Account> accountList = new List<Account>();
        for(Integer i = 0; i < contactList.size(); i++){
            Account acc = new Account();
            acc.Name = 'Sample Account '+ i;
            accountList.add(acc);
        }
        if(!accountList.isEmpty()){
            try{
                insert accountList;
            }catch(Exception e){
                System.debug(e.getMessage());
            }
        }
        for(Integer i = 0; i < contactList.size(); i++){
            contactList[i].accountId = accountList[i].Id;
        }
        
    }
    
    public static void afterContactInserted(List<contact> contactList){
        List<contact> newContactList = new List<contact>();
        Account acc = new Account(Name = 'abc');
        insert acc;
        for(Contact conta : newContactList){
            Contact con = new Contact();
            con.accountId = acc.Id;
            con.Id = conta.Id;
            newContactList.add(con);
        }
        update newContactList;
        
        
    }
}
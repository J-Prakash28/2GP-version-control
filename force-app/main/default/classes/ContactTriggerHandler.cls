public class ContactTriggerHandler {
    public static void beforeInsert(List<contact> contactList){
        updateAccount(contactList);
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
}
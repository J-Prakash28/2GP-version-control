public class AccountTriggerHandler2 {
    public static void beforeInsert(List<Account> accList) {
		assignAccountValues(accList);
    }
    
    public static void afterInsert(List<Account> accList){
        createOpportunity(accList);
    }
    
    public static void assignAccountValues(List<Account> accList){
        for(Account acc : accList)
        {
            acc.Rating = 'Hot';
        }
    }
}
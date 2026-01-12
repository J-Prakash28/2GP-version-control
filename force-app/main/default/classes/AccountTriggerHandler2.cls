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

    public static void createOpportunity(List<Account> accList){
        List<Opportunity> oppList = new List<Opportunity>();
        for(Account acc : accList){
            Opportunity opp = new Opportunity();
            opp.Name = 'Test Opportunity';
            opp.accountId = acc.Id;
            oppList.add(opp);
        }
        if(!oppList.isEmpty()){
            insert oppList;
        }
    }
}
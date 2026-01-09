public class TestObjectFactory {
    public static List<contact> contactCreation(Integer num){
        List<contact> contactList = new List<contact>();
        for(Integer i = 0; i < num; i++){
            Contact con = new Contact();
            con.LastName = 'Test Contact ' + i;
            contactList.add(con);
        }
        return contactList;
    }
    
    public static List<account> accountCreation(Integer num){
        List<account> accountList = new List<account>();
        for(Integer i = 0; i < num; i++){
            Account acc = new Account();
            acc.Name = 'Test Account ' + i;
            accountList.add(acc);
        }
        return accountList;
    }
}
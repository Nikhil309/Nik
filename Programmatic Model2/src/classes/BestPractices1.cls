public with sharing class BestPractices1 {
    public void assConToAcc(list<Contact> con){
        list<String> contactEmailDomains=new list<String>();
        
        for(Contact contactlist:con){
            contactEmailDomains.add(contactlist.Email.split('@').get(1));
        }
        list<Account> accountlist = [select Id,Domain__c from Account where Domain__c IN:contactEmailDomains];
        map<String, Id> domainmap = new map<String, Id>();
        
        for(Account acc:accountlist){
             domainmap.put(acc.Domain__c,acc.Id);
        } 
        for(Contact cont: con){
            String domain = cont.Email.split('@').get(1);
            if(domainmap.containsKey(domain)){//Returns true if the map contains a mapping for the specified key.
               cont.AccountId = domainmap.get(domain); 
            }
        }
    }
}
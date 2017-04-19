trigger CloneTrigger on Opportunity (After insert) {
        TriggerSetting__c check = TriggerSetting__c.getInstance(UserInfo.getUserID() );
    if(!check.CloneTrigger__c) {
        return;
    }
   if(Trigger.isAfter){
        if(Trigger.isInsert){
            system.debug('Trigger.new-----------------'+Trigger.new);
            if(Cloneclass.runOnce()){
            list<Opportunity> clone=new list<opportunity>();
            for(Opportunity o: Trigger.new){
                     clone.add(new Opportunity(Name=o.Name,StageName=o.StageName,CloseDate=o.closeDate));
            }
                     insert(clone);
                     system.debug('clone-----------------'+clone);
            }
       }
   }
}
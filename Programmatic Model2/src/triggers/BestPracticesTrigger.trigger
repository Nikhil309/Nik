trigger BestPracticesTrigger on Contact (before insert) {
        TriggerSetting__c check = TriggerSetting__c.getInstance(UserInfo.getUserID() );
    if(!check.BestPracticesTrigger__c) {
        return;
    }
    BestPractices1 BP1 = new BestPractices1();
    if(Trigger.isBefore && Trigger.isInsert){
        //call helper Method
        BP1.assConToAcc(Trigger.new);
    }
    
}
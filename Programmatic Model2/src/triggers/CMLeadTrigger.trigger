trigger CMLeadTrigger on CampaignMember (before insert) {
        TriggerSetting__c check = TriggerSetting__c.getInstance(UserInfo.getUserID() );
    if(!check.CMLeadTrigger__c) {
        return;
    }
           RsvpUpdate.updateRsvp(Trigger.new);
}
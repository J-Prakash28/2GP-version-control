trigger AccountTrigger2 on Account (before insert, after insert) {
    
	if(Trigger.isInsert && Trigger.isBefore)
    {
        AccountTriggerHandler2.beforeInsert(Trigger.new);
    }
    
    if(Trigger.isInsert && Trigger.isAfter)
    {
        AccountTriggerHandler2.afterInsert(Trigger.new);
    }
}
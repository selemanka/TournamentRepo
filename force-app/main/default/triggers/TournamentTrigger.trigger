trigger TournamentTrigger on Tournament__c (after update) {
Map<Id,Tournament__c> tournamentList = new Map<Id,Tournament__c>([SELECT Id, Status__c FROM Tournament__c WHERE Id IN :Trigger.new]);
    for(Tournament__c newTournament : Trigger.new){
        Tournament__c oldTournament = Trigger.oldMap.get(newTournament.Id);
        if(newTournament.Status__c != oldTournament.Status__c && oldTournament.Status__c =='Upcoming' && newTournament.Status__c =='Current'){
            
        }
	}
}
trigger TournamentTrigger on Tournament__c (after update) {
	Map<Id,Tournament__c> tournamentList = new Map<Id,Tournament__c>([SELECT Id, Status__c,Type__c, (SELECT Id, Player__r.First_Name__c, Player__r.LastName__c FROM Participations__r)  FROM Tournament__c WHERE Id IN :Trigger.new]);
    List<Tournament__c> currentTournamentList = new List<Tournament__c>();
    for(Tournament__c newTournament : Trigger.new){
        Tournament__c oldTournament = Trigger.oldMap.get(newTournament.Id);
        if(oldTournament.Status__c =='Upcoming' && newTournament.Status__c =='Current'){   
            currentTournamentList.add(tournamentList.get(newTournament.Id));
        }
    }
    TournamentTriggerHandler.generateGames(currentTournamentList);
}
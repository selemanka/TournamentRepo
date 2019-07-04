trigger TournamentTrigger on Tournament__c (after update) {
Map<Id,Tournament__c> tournamentList = new Map<Id,Tournament__c>([SELECT Id, Status__c, (SELECT Id, Player__r.First_Name__c, Player__r.LastName__c FROM Participations__r)  FROM Tournament__c WHERE Id IN :Trigger.new]);
    for(Tournament__c newTournament : Trigger.new){
        Tournament__c oldTournament = Trigger.oldMap.get(newTournament.Id);
        List<Game__c> gameList = new List<Game__c>();
        if(newTournament.Status__c != oldTournament.Status__c && oldTournament.Status__c =='Upcoming' && newTournament.Status__c =='Current'){
            Game__c game = new Game__c();
            
            //game.Tournament__c.Participations__r.Player__r.First_Name__c
        }
	}
}
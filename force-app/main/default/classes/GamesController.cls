public class GamesController {
	@AuraEnabled
    public static List<Game__c> getGames(){
        List<Game__c> gameList = new List<Game__c>([SELECT Name FROM Game__c]);
        return gameList;
    }    
   
    @AuraEnabled
    public static List<Game__c> getGamesRelatedToTournament(Id tournamentId) {
        List<Game__c> gamesRelatedToTournamentList = [SELECT Name, Tournament__r.Id FROM Game__c WHERE Tournament__r.Id = :tournamentId];
        return gamesRelatedToTournamentList;
    }
        
}
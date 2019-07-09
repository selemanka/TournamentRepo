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
        
    @AuraEnabled
    public static List<List<Game__c>> displayRoundRobinGames(Id tournamentId){
        List<Game__c> gameList = new List<Game__c>([SELECT Id, Name, Tournament__r.Id, Player__c, Player1__c, Player__r.First_Name__c, Player1__r.First_Name__c, FirstPlayerScore__c, SecondPlayerScore__c FROM Game__c WHERE Tournament__r.Id = :tournamentId ORDER BY PLayer__c, PLayer1__c]);
        List<Game__c> innerGameList = new List<Game__c>();
        List<List<Game__c>> gameListOfList = new List<List<Game__c>>();
        List<AggregateResult> amountOfPlayersAggr  = [SELECT COUNT(Id)cnt FROM Participation__c WHERE Tournament__r.Id = :tournamentId];         
		Integer countPlayers = (Integer) amountOfPlayersAggr.get(0).get('cnt');
	    Integer i = 0;
        
        for(Game__c game : gameList){
            i++;
            innerGameList.add(game);
            if(i == countPlayers - 1) {
                gameListOfList.add(innerGameList);
                i = 0;
                innerGameList = new List<Game__c>();
            }
        }        
        return gameListOfList;
    }   
}
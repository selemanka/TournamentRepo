public class GamesController {
	@AuraEnabled
    public static List<Game__c> getGames(){
        List<Game__c> gameList = new List<Game__c>([SELECT Name FROM Game__c]);
        return gameList;
    }
}
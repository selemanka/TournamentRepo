public class TournamentTriggerHandler {
    public static void generateGames (List<Tournament__c>  currentTournamentList){
        List<Game__c> gameList = new List<Game__c>();
        for(Tournament__c t : currentTournamentList){
            if(t.Type__c == 'Round Robin'){
                System.debug(t.Participations__r.size());
                gameList.addAll(generateRoundRobinGames(t));                
            }
            
            else{
                
            }
        }
        insert gameList;
    } 
    
    public static List<Game__c> generateRoundRobinGames(Tournament__c tournament){
        List<Game__c> gameList = new List<Game__c>();
        
        for(Integer i = 0; i < tournament.Participations__r.size(); i ++){
            for(Integer j = 0; j < tournament.Participations__r.size(); j ++){
                if(i != j){
                    Game__c game = new Game__c();
                    game.Tournament__c = tournament.Id;
                    game.Name = 'game';
                    game.Player1__c = tournament.Participations__r.get(i).Player__c;
                    game.Player__c = tournament.Participations__r.get(j).Player__c;
                    gameList.add(game);
                }                
            }
        }
        
        return gameList;
    }
    
    
    public static List<Game__c> getGames(Tournament__c tournament){
    	return [SELECT Id FROM Game__c WHERE Tournament__c =: tournament.Id];
    }
    
     public static List<Game__c> generateSingleEliminationGames(Tournament__c tournament){
        return null;
    }
}
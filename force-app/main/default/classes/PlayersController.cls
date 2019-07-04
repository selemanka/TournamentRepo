public class PlayersController {
    @AuraEnabled
    public static List<Player__c> getPlayers(){
         List<Player__c> playerList = new List<Player__c>([SELECT Id,First_Name__c, LastName__c, PlayerEmail__c FROM Player__c]);
         return playerList;
    } 
    
    @AuraEnabled
    public static List<Player__c> getPlayersWhoDontParticipateInTournament(Id tournamentId){
        List<Player__c> playerList = [SELECT Id,First_Name__c, LastName__c, (SELECT Name, Tournament__r.Name FROM Participations__r WHERE Tournament__r.Id =:tournamentId) FROM Player__c];
        List<Player__c> playerNotInTournamentList = new List<Player__c>();
        for(Player__c p : playerList){
            if(p.Participations__r.size() == 0){
                playerNotInTournamentList.add(p);
            }
        }
        return playerNotInTournamentList;
    }
    
    @AuraEnabled
    public static List<Player__c> insertSelectedPlayers(Id tournamentId, List<Player__c> selectedList){
        List<Player__c> playerList = new List<Player__c>([SELECT Id,First_Name__c, LastName__c FROM Player__c /*WHERE Tournament__r.Id =:tournamentId*/]);
        List<Player__c> selectedPlayerList = new List<Player__c>();
        
        for(Player__c p : playerList){
            
            selectedPlayerList.add(p);
        }
        insert selectedPlayerList;
        return selectedPlayerList;
    }
    
    @AuraEnabled
    public static List<Player__c> filterData(String first_name, String last_name, String email){
        first_name= first_name +'%';
        last_name= last_name +'%';
        email= email +'%';
        List<Player__c> filteredDataList;        
        filteredDataList = new List<Player__c>([SELECT First_Name__c, LastName__c, PlayerEmail__c FROM Player__c WHERE First_Name__c LIKE :first_name AND LastName__c LIKE :last_name AND PlayerEmail__c  LIKE :email]);   
        return filteredDataList;
    }
}
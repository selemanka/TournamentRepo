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
    public static List<Participation__c> applyPlayersForTheTournament(Id tournamentId, List<Player__c> selectedPlayers){
       System.debug('tournament: ' + tournamentId);
       System.debug('selectedPlayers: ' + selectedPlayers);
       List<Participation__c> participationList = new List<Participation__c>();
        for(Player__c pl : selectedPlayers){
            Participation__c participation = new Participation__c();
            participation.Name = '1';
            participation.Tournament__c = tournamentId;
            participation.Player__c = pl.Id;
            participationList.add(participation);
        }
       insert participationList;
       return null;
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
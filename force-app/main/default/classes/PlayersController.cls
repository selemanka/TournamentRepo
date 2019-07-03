public class PlayersController {
    @AuraEnabled
    public static List<Player__c> getPlayers(){
         List<Player__c> playerList = new List<Player__c>([SELECT Id,First_Name__c, LastName__c, PlayerEmail__c FROM Player__c]);
         return playerList;
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
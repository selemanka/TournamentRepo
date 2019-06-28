public class TournamentsController {
    @AuraEnabled
    public static List<Tournament__c> getTournaments(){
         List<Tournament__c> tournamentList = new List<Tournament__c>([SELECT Id, Name, Status__c, Type__c, Date__c FROM Tournament__c]);
         return tournamentList;
    } 
}
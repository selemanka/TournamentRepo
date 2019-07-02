public class TournamentsController {
    
    @AuraEnabled
    public static List<Tournament__c> filterData(String name, String status, String type, Date daate){
        name = name +'%';
        status = status +'%';
        type = type +'%';
        List<Tournament__c> filteredDataList;
        if(daate != null){
            filteredDataList = new List<Tournament__c>([SELECT  Name, Status__c, Type__c,Date__c FROM Tournament__c WHERE Name LIKE :name AND Status__c LIKE :status AND Type__c  LIKE :type AND Date__c  = :daate]);        
        }
        else{
            filteredDataList = new List<Tournament__c>([SELECT  Name, Status__c, Type__c,Date__c FROM Tournament__c WHERE Name LIKE :name AND Status__c LIKE :status AND Type__c  LIKE :type]);          
        }
        return filteredDataList;
    }
    
 }
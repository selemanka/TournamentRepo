({
	   handleSubmit: function(component, event, helper) {
        //component.set('v.disabled', true);
        console.log('submit');
        var record = event.getParam("response"); 
           console.log(JSON.stringify(record));
           component.get("v.tournament").Id = record.id;
           component.get("v.tournament").Name = record.fields.Name.value;
           component.get("v.tournament").Type__c = record.fields.Type__c.value;
           component.get("v.tournament").Status__c = record.fields.Status__c.value;
           component.get("v.tournament").Date__c = record.fields.Date__c.value;
                      
           console.log(JSON.stringify(component.get("v.tournament")));
           
            var createTournamentEvent = component.getEvent("pushTournament");
            createTournamentEvent.setParams({ "tournament": component.get("v.tournament") });
            createTournamentEvent.fire();
    },
    openModel: function(component, event, helper) {
      component.set("v.isModalOpen", true);
   },
  
   closeModel: function(component, event, helper) {
      component.set("v.isModalOpen", false);
   }

})
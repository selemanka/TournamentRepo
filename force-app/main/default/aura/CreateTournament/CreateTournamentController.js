({
	   handleSubmit: function(cmp, event, helper) {
        //cmp.set('v.disabled', true);
        console.log('submit');
        var record = event.getParam("response"); 
           console.log(JSON.stringify(record));
           cmp.get("v.tournament").Id = record.id;
           cmp.get("v.tournament").Name = record.fields.Name.value;
           cmp.get("v.tournament").Type__c = record.fields.Type__c.value;
           cmp.get("v.tournament").Status__c = record.fields.Status__c.value;
           cmp.get("v.tournament").Date__c = record.fields.Date__c.value;
                      
           console.log(JSON.stringify(cmp.get("v.tournament")));
           
            var createTournamentEvent = cmp.getEvent("pushTournament");
            createTournamentEvent.setParams({ "tournament": cmp.get("v.tournament") });
            createTournamentEvent.fire();
    },
    openModel: function(component, event, helper) {
      component.set("v.isModalOpen", true);
   },
  
   closeModel: function(component, event, helper) {
      component.set("v.isModalOpen", false);
   }
})
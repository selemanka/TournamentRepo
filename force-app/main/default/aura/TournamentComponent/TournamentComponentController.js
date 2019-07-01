({    
      getTournamentsList : function(component, event, helper) {
          var action = component.get("c.getTournaments");  
       	  action.setCallback(this, function(response) {
            var state = response.getState();
            if(state === 'SUCCESS') {
                var tournamentList = response.getReturnValue();
                component.set("v.tournamentList",tournamentList);
            }
            else {
                alert('Error in getting data');
            }
        });
        $A.enqueueAction(action);
       },
    
    filter : function(component, event, helper){
        console.log(component.get("v.Name"));
    }
})
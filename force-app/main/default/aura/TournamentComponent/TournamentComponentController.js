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
        var action = component.get("c.filterData");
        action.setParams({name : component.get("v.Name"),
                          status : component.get("v.Status"),
                          type : component.get("v.Type"),
                          daate :component.get("v.Date")});
        action.setCallback(this, function(response) {
        var state = response.getState();
            if(state === 'SUCCESS') {
				var filteredDataList = response.getReturnValue();                
				component.set("v.tournamentList",response.getReturnValue());
             }
            else {
				alert('Error in getting data');
            }
        });
        $A.enqueueAction(action);
    },
    clear : function(component, event, helper){
        component.set("v.Name", '');
        component.set("v.Status", '');
        component.set("v.Type", '');
    }
})
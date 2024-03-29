({    
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
        component.set("v.Date", null);
    },
    handleCreateTournament : function(component, event, helper){
        var newTournament = event.getParam("tournament");
        console.log(JSON.stringify(newTournament));
        var tournamentList = component.get("v.tournamentList");
        tournamentList.push(newTournament);
        component.set("v.tournamentList", tournamentList);
    },
    openModel : function(component, event, helper){
        component.set("v.isModalOpen", true);
        //console.log(event.currentTarget);
        //console.log('open modal')
        var index = parseInt(event.currentTarget.dataset.index);
        console.log(component.get("v.tournamentList")[index]);
        component.set("v.tournament", component.get("v.tournamentList")[index]);       
       
    },
   
    handleCloseDetail: function(component, event, helper){
        component.set("v.isModalOpen", false); 
        component.set("v.tournament", null);
    }    
})
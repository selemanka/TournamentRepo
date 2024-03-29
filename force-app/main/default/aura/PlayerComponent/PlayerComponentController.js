({
    filter : function(component, event, helper){
        var action = component.get("c.filterData");
        action.setParams({first_name : component.get("v.firstName"),
                          last_name : component.get("v.lastName"),
                          email : component.get("v.Email")});
        action.setCallback(this, function(response) {
        var state = response.getState();
            if(state === 'SUCCESS') {
				var filteredDataList = response.getReturnValue();                
				component.set("v.playerList",response.getReturnValue());
             }
            else {
				alert('Error in getting data');
            }
        });
        $A.enqueueAction(action);
    },
    clear : function(component, event, helper){
        component.set("v.firstName", '');
        component.set("v.lastName", '');
        component.set("v.Email", '');
    },
 	openModel : function(component, event, helper){
         component.set("v.isModalOpen", true);
         var index = parseInt(event.currentTarget.dataset.index);
         console.log(component.get("v.playerList")[index]);
         component.set("v.player", component.get("v.playerList")[index]);   
     }    
})
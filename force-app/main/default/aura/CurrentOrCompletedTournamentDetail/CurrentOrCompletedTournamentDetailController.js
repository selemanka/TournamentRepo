({
	displayGames : function(component, event, helper) {		 
            var action = component.get("c.getGames");
            action.setCallback(this, function(data){
            component.set("v.playerList",data.getReturnValue());
            });              
        	$A.enqueueAction(action);
        }
})
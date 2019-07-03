({
	displayGames : function(component, event, helper) {		 
            var action = component.get("c.getGamesRelatedToTournament");
            action.setParams({
                tournamentId : component.get("v.tournament").Id
            });
            action.setCallback(this, function(data){
            component.set("v.gameList",data.getReturnValue());                
            });              
        	$A.enqueueAction(action);
        }
})
({
	displayGames : function(component, event, helper) {		
        console.log('t:'+component.get("v.tournament"));
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
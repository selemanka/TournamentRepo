({
	displayGames : function(component, event, helper) {
		console.log('t:'+component.get("v.tournament").Name);
        var action = component.get("c.getGamesRelatedToTournament");
        action.setParams({
            tournamentId : component.get("v.tournament").Id
        });
        action.setCallback(this, function(response){
            component.set("v.gamesList",response.getReturnValue()); 
            console.log(component.get("v.gamesList").length);
        });              
        $A.enqueueAction(action);
	}
})
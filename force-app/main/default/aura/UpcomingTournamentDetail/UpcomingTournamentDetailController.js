({
	displayPlayers : function(component, event, helper) {		 
            var action = component.get("c.getPlayersWhoDontParticipateInTournament");
        	action.setParams({
                tournamentId : component.get("v.tournament").Id
            });
            action.setCallback(this, function(data){
            component.set("v.playerList",data.getReturnValue());
            });              
        	$A.enqueueAction(action);
        }
})
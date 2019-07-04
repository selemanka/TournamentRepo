({
	displayPlayers : function(component, event, helper) {	
        console.log('sdfds: '+component.get("v.tournamentId"))
            var action = component.get("c.getPlayersWhoDontParticipateInTournament");
            action.setParams({
                    tournamentId : component.get("v.tournament").Id
            });
            action.setCallback(this, function(data){
            component.set("v.playerList",data.getReturnValue());
            });              
        	$A.enqueueAction(action);
        },
   
    submitPlayers : function(component, event, helper) {
        console.log('pl: '+JSON.stringify(component.get("v.playerList")));
        var selectedPlayers = [];
        
        for(var i=0; i<component.get("v.playerList").length; i++){
            if(component.get("v.playerList")[i].selected == "yes"){
            selectedPlayers.push(component.get("v.playerList")[i]);            
        	} 
        }       
        
        var action = component.get("c.applyPlayersForTheTournament");
        action.setParams({
                    tournamentId : component.get("v.tournament").Id,
    				selectedPlayers : selectedPlayers 
        });
        
        action.setCallback(this, function(response) {
        var state = response.getState();
            if(state === 'SUCCESS') {
				var selectedList = response.getReturnValue();                
				component.set("v.selectedList",response.getReturnValue());
             }
            else {
				alert('Error');
            }
        });
        $A.enqueueAction(action);
    } 
})
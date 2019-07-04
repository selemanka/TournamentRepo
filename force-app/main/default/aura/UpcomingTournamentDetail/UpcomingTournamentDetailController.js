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
    selectPlayersToParticipate : function(component, event, helper) {
        var playerList = component.get("v.playerList");
        var index = parseInt(event.currentTarget.dataset.index);
        var player = component.get("v.playerList")[index]
        
        for(var i=0; i<playerList.length; i++){
        if(playerList[i].selected == true){            
        	selectedList.push(playerList[i].First_Name__c);
            component.set("v.selectedList", component.get("v.playerList")[index]);
        }
      }
    },
     /*getButtonValue:function(component,event,helper){
        var checkCmp = component.find("chkbox").get("v.value");
        component.set("v.chkboxvalue",checkCmp);
    },*/
    submitPlayers : function(component, event, helper) {
        var action = component.get("c.insertSelectedPlayers");
        action.setParams({
                    tournamentId : component.get("v.tournament").Id,
    				selectedList : component.get("v.selectedList")
        });
        
        action.setCallback(this, function(response) {
        var state = response.getState();
            if(state === 'SUCCESS') {
				var filteredDataList = response.getReturnValue();                
				component.set("v.selectedList",response.getReturnValue());
             }
            else {
				alert('Error in getting data');
            }
        });
        $A.enqueueAction(action);
    } 
})
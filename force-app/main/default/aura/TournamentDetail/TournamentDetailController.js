({
	closeModel: function(component, event, helper) {
      var closeDetailEvent = component.getEvent("closeDetail");           
	   closeDetailEvent.fire();
   }
})
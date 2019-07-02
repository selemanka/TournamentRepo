<aura:application extends="force:slds">
    <lightning:tabset>
        <lightning:tab label="Tournaments">            
                <c:TournamentComponent/> 
         </lightning:tab>
         <lightning:tab label="Players">
                <c:PlayerComponent/>
          </lightning:tab>
	</lightning:tabset>
</aura:application>
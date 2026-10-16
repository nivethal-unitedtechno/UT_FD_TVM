({
	doInit : function(component, event, helper) {
       component.set('v.isOpen', true);
       var flow = component.find('flow');
       flow.startFlow('Previous_Sales_Results_Creator');
    },

closeFlowModal : function(component, event, helper) {
        component.set("v.isOpen", false);
    },

closeModalOnFinish : function(component, event, helper) {
        if(event.getParam('status') === "FINISHED") {
            component.set("v.isOpen", false);
        }
    }
})
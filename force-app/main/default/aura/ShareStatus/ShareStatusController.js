({
    doInit : function(component, event, helper) {
        var value = component.get('v.recordId'); 
        var out = {
            recordId: value
        };
        helper.getData(component,out);
    }

})
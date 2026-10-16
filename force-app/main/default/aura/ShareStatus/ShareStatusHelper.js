({
    getData : function(component,out) {
        component.set("v.showSpinner",true);
        var action = component.get('c.getData');
        action.setParams({
            jsonIn : JSON.stringify(out)
        });
        action.setCallback(this,function(response){
            if(response.getState() === "SUCCESS"){
                //alert(response.getReturnValue());
                var results = JSON.parse(response.getReturnValue());   
                component.set("v.connection",results.connectionName);
                component.set("v.status",results.status);
                component.set("v.showSpinner",false);
            } 
        });
        $A.enqueueAction(action);
    }
})
public class SalesforceConnect {
    
    public static void getCasesFromSalesforceOrgB(){
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('callout:SFDCB/services/apexrest/Cases');
        request.setMethod('GET');
        
        HttpResponse response = http.send(request);
        // If the request is successful, parse the JSON response.
        if (response.getStatusCode() == 200) {
            List <object> results = (List <object>)JSON.deserializeUntyped(response.getBody());
            for (object result : results){
                map<String, object> caseProps = (map<String, object>) result;
                system.debug('caseNumber: ' + caseProps.get('CaseNumber') + '- Subject: ' + caseProps.get('Subject') );
            }
            
        }
        
    }

}
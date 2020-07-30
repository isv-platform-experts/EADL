

//Create Dashbaord from EA template
String templateApiName = 'eadxtest__TemplateAppTest';

Map<String, Object> appConfiguration = new Map<String, Object>();
appConfiguration.put('deleteAppOnConstructionFailure', true);
appConfiguration.put('autoShareWithLicensedUsers', true);
appConfiguration.put('autoShareWithOriginator', true);

Map<String, Object> configuration = new Map<String, Object>();
        
configuration.put('appConfiguration', appConfiguration);

WaveAutoInstallRequest newRequest = new WaveAutoInstallRequest();
newRequest.put('Name', ' (' + templateApiName + ') WaveAppCreate request');
newRequest.put('TemplateApiName', templateApiName);
newRequest.put('RequestStatus', 'Enqueued');
newRequest.put('RequestType', 'WaveAppCreate');
newRequest.put('Configuration', JSON.serialize(configuration));

insert newRequest;
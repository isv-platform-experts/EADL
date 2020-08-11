//Create a standard user
Profile p = [select Id from Profile where Name='Standard User'];

String orgId = UserInfo.getOrganizationId();
String dateString =  String.valueof(Datetime.now()).replace(' ','').replace(':','').replace('-','');
Integer randomInt = Integer.valueOf(math.rint(math.random()*1000000));
String uniqueName = orgId + dateString + randomInt;

//Doing it through apex because it must be unique
User u = new user();
u.LastName = 'User';
u.FirstName = 'Standard';
u.Email = uniqueName + '@test' + orgId + '.org';
u.Alias = 'Tstan';
u.Username = uniqueName + '@test' + orgId + '.org';
u.CommunityNickname = 'test12';
u.LocaleSidKey = 'en_US';
u.TimeZoneSidKey = 'GMT';
u.ProfileID = p.Id;
u.LanguageLocaleKey = 'en_US';
u.EmailEncodingKey = 'UTF-8';
insert u;


//Assign Analytics View Only User Permission Set
PermissionSet ps = [select Id from PermissionSet where Label='Analytics View Only User'];
PermissionSetAssignment psa = new PermissionSetAssignment (PermissionSetId = ps.Id, AssigneeId = u.Id);
insert psa;

Account a = new Account();
a.name='testAccount';
insert a;

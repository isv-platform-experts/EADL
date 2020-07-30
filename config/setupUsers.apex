//Create a standard user
Profile p = [select Id from Profile where Name='Standard User'];

//Doing it through apex because it must be unique
User u = new user();
u.LastName = 'User';
u.Email = 'test@test.com';
u.Alias = 'Tstandard';
u.Username = 'Standard';
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

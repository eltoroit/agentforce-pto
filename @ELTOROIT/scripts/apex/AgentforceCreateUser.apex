String username = 'agent001@' + UserInfo.getOrganizationId() + '.ext';
Profile profile = [SELECT Id FROM Profile WHERE Name='Einstein Agent User' Limit 1];
User u = new User(
    // human_resources_agent@00dot00000luqsr.ext
    Username = username,
    FirstName = 'Custom',
    LastName = 'Human Resources Agent',
    Email = 'noreply@salesforce.com',
    // UserLicense='Einstein Agent',
    ProfileId = profile.Id,
    EmailEncodingKey = 'UTF-8',
    LocaleSidKey = 'en_US',
    LanguageLocaleKey = 'en_US',
    TimeZoneSidKey = 'America/Los_Angeles',
    Alias = 'Agent'
);
insert u;

// Assign permission sets
PermissionSet permSet;
PermissionSetGroup permSetGroup;
PermissionSetAssignment psa;
List<PermissionSetAssignment> psas = new List<PermissionSetAssignment>();
// AgentforceServiceAgentBase
permSet = [SELECT Id FROM PermissionSet WHERE Name = 'AgentforceServiceAgentBase'];
psa = new PermissionSetAssignment(
    AssigneeId = u.Id,
    PermissionSetId = permSet.Id
);
psas.add(psa);
// AgentforceServiceAgentUserPsg
// permSet =[SELECT Id FROM PermissionSet WHERE Name = 'AgentforceServiceAgentUserPsg'];
permSetGroup = [SELECT Id FROM PermissionSetGroup WHERE DeveloperName = 'AgentforceServiceAgentUserPsg'];
psa = new PermissionSetAssignment(
        AssigneeId = u.Id,
        // PermissionSetId = permSet.Id,
        PermissionSetGroupId = permSetGroup.Id
);
psas.add(psa);
insert psas;

// throw new AuraException('DO NOT COMMIT');
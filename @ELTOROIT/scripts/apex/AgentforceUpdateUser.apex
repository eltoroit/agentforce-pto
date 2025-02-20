String username = 'agent001@' + UserInfo.getOrganizationId() + '.ext';
User u = [SELECT Id FROM User WHERE Username = :username];

PermissionSetAssignment psa;
List<PermissionSetAssignment> psas = new List<PermissionSetAssignment>();
PermissionSet permSet = [SELECT Id FROM PermissionSet WHERE Name = 'psAgent'];
psa = new PermissionSetAssignment(
    AssigneeId = u.Id,
    PermissionSetId = permSet.Id
);
psas.add(psa);
insert psas;

// throw new AuraException('DO NOT COMMIT');
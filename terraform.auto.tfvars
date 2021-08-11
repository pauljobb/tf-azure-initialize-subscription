location = "Canada Central"

resource_naming_prefix = "goa-cc-grpname"

resource_tags = {
    application-id = "TBD",
    application-name = "TBD",
    backup-business-contact = "paul.jobb@gmail.com",
    cost-center = "42",
    criticality = "critical",
    environment = "Production",
    general-ledger-account = "42",
    goa-shared-service = "yes",
    hours-of-operation = "24x7",
    internal-order = "42",
    ministry = "Ministry A",
    primary-business-contact = "paul_jobb@hotmail.com",
    sector = "Enterprise Services",
    security-classification = "Potected C",
    sos-id = "42",
    stra-id = "42",
    technical-contact = "paul.jobb@gmail.com"
}

role_groups = [
    {
        group = "test_group" 
        role = "Contributor"
    },
    {
        group = "reader group" 
        role = "Reader"
    },
    {
        group = "owner group" 
        role = "Owner"
    }
]

vnet_address_space = ["10.0.0.0/16"]

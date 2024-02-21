namespace riskmanagement;


using{ managed } from '@sap/cds/common';
// namespace company;
// @odata.draft.enabled
// entity department:managed {
//     depID: UUID;
//     depName: String;
//     description: String;
    
// }
entity Risk : managed {
    Key ID  :UUID @(Core.Computed: true);
        title   :String(100);
        owner   :String;
        prio    :String(5);
        descr   :String;
        miti    :Association to Mitigations;
        bp      :Association to BusinessPartner;
        Impacts :Integer;
        criticality :Integer;
    
}
entity Mitigations :managed{
    Key ID  :UUID@(Core.Computed:true);
    descr   :String;
    owner   :String;
    timeline    :String;
    Risk    :Association to many Risk on Risk.miti=$self;
}
entity Impacts{
    ID      :Integer;
    desc    :String;
}


// using external api
using { API_BUSINESS_PARTNER as external } from '../srv/external/API_BUSINESS_PARTNER.csn';

entity BusinessPartner as projection on external.A_BusinessPartner{
    key BusinessPartner,LastName ,FirstName 
}



using{riskmanagement as my} from '../db/schema';

// service departmentSevice {
//     entity department as projection on my.department    

// }
service RiskService{
    entity Risk as projection on my.Risk;
    annotate Risk with @odata.draft.enabled;
    entity Mitigations as projection on my.Mitigations
    annotate Mitigations with @odata.draft.enabled;
    entity Impacts as projection on my.Impacts
    entity BusinessPartners as projection on my.BusinessPartner
    
}


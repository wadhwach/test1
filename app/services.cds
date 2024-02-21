using from './project1/annotations';
using riskmanagement as rm from '../db/schema'; // Annotate Risk elements
 
annotate rm.Risk with {
    ID          @title: 'Risk';
    title       @title: 'Title';
    owner       @title: 'Owner';
    prio        @title: 'Priority';
    descr       @title: 'Description';
    miti        @title: 'Mitigation';
    Impacts     @title: 'Impact';
    bp          @title: 'Business Partner';
    criticality @title: 'Criticality';
} // Annotate Miti elements
 
annotate rm.Mitigations with {
    ID    @(
        UI.Hidden,
        Common: {Text: descr}
    );
    owner @title: 'Owner';
    descr @title: 'Description';
} //### BEGIN OF INSERT
 
annotate rm.BusinessPartner with {
    BusinessPartner @(
        UI.Hidden,
        Common: {Text: LastName}
    );
    LastName        @title: 'Last Name';
    FirstName       @title: 'First Name';
} //### END OF INSERT
 
annotate rm.Risk with {
    miti @(Common: {
        //show text, not id for mitigation in the context of risks
        Text           : miti.descr,
        TextArrangement: #TextOnly,
        ValueList      : {
            Label         : 'Mitigations',
            CollectionPath: 'Mitigations',
            Parameters    : [
                {
                    $Type            : 'Common.ValueListParameterInOut',
                    LocalDataProperty: miti_ID,
                    ValueListProperty: 'ID'
                },
                {
                    $Type            : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty: 'descr'
                }
            ]
        }
    }); //### BEGIN OF INSERT
    bp   @(Common: {
        Text           : bp.LastName,
        TextArrangement: #TextOnly,
        ValueList      : {
            Label         : 'Business Partners',
            CollectionPath: 'BusinessPartners',
            Parameters    : [
                {
                    $Type            : 'Common.ValueListParameterInOut',
                    LocalDataProperty: bp_BusinessPartner,
                    ValueListProperty: 'BusinessPartner'
                },
                {
                    $Type            : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty: 'LastName'
                },
                {
                    $Type            : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty: 'FirstName'
                }
            ]
        }
    })
}
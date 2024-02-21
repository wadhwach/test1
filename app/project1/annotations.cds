using RiskService as service from '../../srv/service';

annotate service.Risk with @(
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Label : 'Title',
            Value : title,
        },
        {
            $Type : 'UI.DataField',
            Label : 'Owner',
            Value : owner,
        },
        {
            $Type : 'UI.DataField',
            Label : 'Priority',
            Value : prio,
            Criticality:criticality
        },
        {
            $Type : 'UI.DataField',
            Label : 'Descrption',
            Value : descr,
        },
        {
            $Type : 'UI.DataField',
            Label : 'Impact',
            Value : Impacts,
            Criticality:criticality
        },
    ],
    UI.SelectionFields:[
        prio,miti_ID
    ],
);
annotate service.Risk with {
    miti @Common.ValueList : {
        $Type : 'Common.ValueListType',
        CollectionPath : 'Mitigations',
        Parameters : [
            {
                $Type : 'Common.ValueListParameterInOut',
                LocalDataProperty : miti_ID,
                ValueListProperty : 'ID',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'descr',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'owner',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'timeline',
            },
        ],
    };
    
    Impacts @common.value.list:{
    $Type:'Common.ValueListType',
    CollectionPath:'Impacts',
    parameters  :[
        {
            $Type   :'Common.ValueListType',
            LocalDataProperty:Impacts,
            LocalValueProperty:'ID'
        },
        {
            $Type   :'Common.ValueListParameterDisplayOnly',            
            LocalListProperty:'desc',
        }]
    };
}
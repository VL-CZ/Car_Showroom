(: zobrazi vsechny znacky aut a modely aut v tabulce + zvyrazni modely znacky Audi :)
(: XHTML :)
element html{
    element div{
        text{'We offer cars of following brands: '},
        string-join(distinct-values(//car-models/car-model/brand), ', ')
    },
    element table{
        for $cm in //car-models/car-model
        return
            element tr{
                attribute style{
                    if($cm/brand = 'Audi')
                    then 'background:gray'
                    else 'background:white'
                },

                element td{ data($cm/brand)},
                element td{ data($cm/model)}
            }
    }
}
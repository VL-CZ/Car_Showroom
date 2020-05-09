(: vybere vsechny modely aut (i ty, co uz nejsou v prodeji) a seradi je podle abecedy :)
(: INTEGRATE :)
let $car-models :=
    for $cm in //car-models/car-model
    order by $cm/brand, $cm/model
    return
        element car-model{
            text{$cm/brand},
            text{' '},
            text{$cm/model}
        }
let $unavalaible-car-models :=
    for $ucm in //unavailable-car-models/car-model
    return $ucm

for $cm in $car-models | $unavalaible-car-models
return $cm
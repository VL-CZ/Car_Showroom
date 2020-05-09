(: vybere vsechny modely aut (i ty, co uz nejsou v prodeji) a seradi je podle znacky a pote podle modelu :)
(: INTEGRATE :)
for $car-model in (//car-models/car-model, //unavailable-car-models/car-model)
order by $car-model/brand, $car-model/model
return $car-model
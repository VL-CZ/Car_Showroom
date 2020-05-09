(: vybere vsechny modely aut, pro ktere existuje aspon 1 auto s cenou 1,000,000 nebo mensi :)
for $car_model in //car-models/car-model
let $cars := //cars/car[@model = $car_model/@id-car-model]
where min($cars/price) <= 1000000
return $car_model
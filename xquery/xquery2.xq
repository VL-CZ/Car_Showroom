(: vybere vsechny modely aut, pro ktere existuje aspon 1 auto s cenou 1,000,000 nebo mensi :)
(: JOIN :)
for $brand in distinct-values(//car-models/car-model/brand)
order by $brand descending
return $brand
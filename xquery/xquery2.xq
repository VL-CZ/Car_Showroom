(: vybere vsechny auta, ktera maji ve vybave kozena sedadla :)
(: JOIN :)
for $car in //cars/car
for $car-model in //car-models/car-model
where $car/@model = $car-model/@id-car-model
where some $f in $car/feature-list/feature
    satisfies $f = 'leather seats'
return
<car>
    <model>
        {data($car-model/brand)} {data($car-model/model)}
    </model>
    {$car/price}
    {$car/engine}
    {$car/feature-list}
</car>


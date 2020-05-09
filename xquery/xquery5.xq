(: vybere auta s cenou bez dane :)
(: FUNCTION :)
declare function getCarNoTax($car) as element()
{
    let $tax := 21
    let $price := (100 - $tax) * 0.01 * xs:int($car/price)
    return
        <car model="{$car/@model}">
            <price tax="no">{$price}</price>
            {$car/color}
            {$car/engine}
            {$car/feature-list}
        </car>
};

for $c in //cars/car
return getCarNoTax($c)
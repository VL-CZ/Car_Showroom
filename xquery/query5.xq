(: vybere auta s cenou bez dane :)
(: FUNCTION :)
declare function local:getCarNoTax($car) as element()*
{
    let $tax := 21 * 0.01
    let $price := (1 - $tax) * xs:int($car/price)
    let $model-id := data($car/@model)

    return
        <car model="{$model-id}">
            <price tax="no">{$price}</price>
            {$car/color}
            {$car/engine}
            {$car/feature-list}
        </car>
};

for $c in //cars/car
return local:getCarNoTax($c)
(: FUNCTION :)
declare function getAllRedCars($color) as element()*
{
for $car in //cars/car
where $car/color = $color
return $car
};

for $rc in //
return
<c>
{$rc}
</c>
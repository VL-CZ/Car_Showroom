(:  :)
(: FUNCTION :)
declare function getCompactView($car) as element()*
{
return $car
};

<cars>
{
for $c in //cars/car
return $c
}
</cars>
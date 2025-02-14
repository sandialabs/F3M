# Continuous Tank (Surge)
````{compound}
:class: only-dark
```{image} assets/cont_tank_s.png
:class: bg-primary
:width: 50%
:align: left
```
````

````{compound}
:class: only-light
```{image} assets/cont_tank_s_L.png
:class: bg-primary
:width: 50%
:align: left
```
````

<br>
<br>

**Library**:
<br>
Fissile Facility Flow Modeler/Aqueous


<br clear="left"/>

## Description
This surge continuous models a tank that fills and empties based on user specified criteria and an external surge signal. For this tank to output, both the tank setpoints (i.e., tank on and off points) must be met and the surge signal must be on.

## Mask dialog options
Tank level basis : string
: The element or isotope used for the tank level min and max.

Tank off point (kg) : float
: The switch off level for the tank. If the tank inventory of the element or isotope specified in `Tank level basis` falls below this value, then flow out from the block is prohibited.

Tank on point (kg) : float
: The switch on level of the tank. If the tank inventory of the element or isotope specified in `Tank level basis` rises above this value, then flow out from the block is permitted.

Match inflow : boolean
: If selected, then the output flow from this block will match the input flow.

Flowrate (kg/hr): float
: The flowrate out for the tank in kg/hr. 



## Ports
In\(C) : signal
: Signal representing inflow to the tank. Has shape [1677, 1]. Width is dependent on mask dialog input and height is derived to ensure integration of the signal equals the original input entity.

Srg\(C): signal
: Surge signal. Should be either 0 or 1 to represent flow disabled or enabled, respectively.

## Outputs
Out\(C) : signal
: Continuous signal representing tank output. Has the same shape as `In(C)`.


Inv : signal
: Continuous inventory signal with shape [1677, 1]. Updated continuously as `In(C)` and `Out(C)` change.

---

:::{seealso}
[Continuous Tank (Generic)](./cont_tank_g.md)
:::

# Continuous Tank (Generic)
````{compound}
:class: only-dark
```{image} assets/cont_tank_g.png
:class: bg-primary
:width: 50%
:align: left
```
````

````{compound}
:class: only-light
```{image} assets/cont_tank_g_L.png
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
The generic continuous tank models a tank that fills and empties based on user specified criteria. 

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

## Outputs
Out\(C) : signal
: Continuous signal representing tank output. Has the same shape as `In(C)`.


Inv : signal
: Continuous inventory signal with shape [1677, 1]. Updated continuously as `In(C)` and `Out(C)` change.

---

:::{seealso}
[Continuous Tank (Surge)](./cont_tank_s.md)
:::
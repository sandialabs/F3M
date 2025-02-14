# Sample Tank
````{compound}
:class: only-dark
```{image} assets/sample_tank.png
:class: bg-primary
:width: 50%
:align: left
```
````

````{compound}
:class: only-light
```{image} assets/sample_tank_L.png
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
The sample tank simulates the sampling of a material flow. Specifically, this block fills, holds material for a specified amount of time, then empties. The user can optionally specify additional material that should be added when the inflow is non-zero (i.e., material is arriving at this block). 

When the tank inventory for `Process level basis` falls below the Tank off point, flow out is prohibited and the surge signal turns on.

## Mask dialog options
Tank level basis : string
: The element or isotope used for the tank level min and max.

Tank off point (kg) : float
: The switch off level for the tank. If the tank inventory of the element or isotope specified in `Tank level basis` falls below this value, then flow out from the block is prohibited and the surge signal is activated.

Tank on point (kg) : float
: The switch on level of the tank. If the tank inventory of the element or isotope specified in `Tank level basis` rises above this value, then flow out from the block is permitted after a hold period `Sample time (hr)` has elapsed.

Match inflow : boolean
: If selected, then the output flow from this block will match the input flow.

Flowrate (kg/hr): float
: The flowrate out for the tank in kg/hr. 

Additions : string, float
: An optional table of strings specifying a species (either elemental or isotopic) and a flow rate. If this table is used, materials are only added when a non-zero signal is present in `In(c)`. 

Sample time (hr) : float
: The amount of time to hold material after the `Tank on point` has been reached.

## Ports
In\(C) : signal
: Signal representing inflow to the tank. Has shape [1677, 1]. Width is dependent on mask dialog input and height is derived to ensure integration of the signal equals the original input entity.


Feed\(C) : signal
: Optional feed signal. Should have shape [1677, 1]. 


## Outputs
Out\(C) : signal
: Continuous signal representing tank output. Has the same shape as `In(C)`.

Srg\(C): signal
: Surge signal. Should be either 0 or 1 to represent flow disabled or enabled, respectively.

Add\(C): signal
: Signal that represents material that is being added by the additions dialog table. Can be used for consistency checks.

Inv : signal
: Continuous inventory signal with shape [1677, 1]. Updated when entities enter and the residual signal leaves.